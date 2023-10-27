//
//  LoadingScreenViewManager.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 02.02.2023.
//
import Router
import UIKit
import Architecture
import MindboxSDK
import AddScreen
import FirebaseFirestore
import Combine

final class LoadingScreenViewManager: ViewManager<LoadingScreenViewController> {
    
    var viewProperties: LoadingScreenViewController.ViewProperties?
    
    // MARK: - private properties -
    
    private var mainTabBarScreenViewManager: MainTabBarScreenViewManager?
    private var anyCancel: Set<AnyCancellable> = []
    private var timer: Timer?
    private let reference = Firestore.firestore()
    private var advertisingRequestData: AdvertisingRequestData {
        var requestData = AdvertisingRequestData()
        requestData.documentReference = self.reference
            .collection("advertising_version_1.0")
            .document("configuration")
        return requestData
    }
    
    // MARK: - DI -
    private let routerService: RouterService
    private let handlerDidTapPushNotificationService: HandlerDidTapPushNotificationService
    private let advertisingFeature: AdvertisingFeature
    private let mindboxService: SDKMindboxService
    private let createAdvertisingScreenVCService: CreateAdvertisingScreenVCService
    
    init(
        routerService: RouterService,
        mindboxService: SDKMindboxService,
        handlerDidTapPushNotificationService: HandlerDidTapPushNotificationService,
        advertisingFeature: AdvertisingFeature,
        createAdvertisingScreenVCService: CreateAdvertisingScreenVCService
    ) {
        self.routerService = routerService
        self.handlerDidTapPushNotificationService = handlerDidTapPushNotificationService
        self.advertisingFeature = advertisingFeature
        self.mindboxService = mindboxService
        self.createAdvertisingScreenVCService = createAdvertisingScreenVCService
    }
    
    //MARK: - Main state view model
    enum State {
        case createViewProperties
        case updateViewProperties
    }
    
    public var state: State? {
        didSet { self.stateManager() }
    }
    
    private func stateManager(){
        guard let state = self.state else { return }
        switch state {
            case .createViewProperties:
                viewProperties = LoadingScreenViewController.ViewProperties(
                    progressValue: 0,
                    didAppear: didAppear
                )
                create?(viewProperties)
                setupProgress()
        case .updateViewProperties:
            self.update?(viewProperties)
        }
    }
    
    private func didAppear(){
        setupHandlerDidTapPushNotificationService()
        setupPush()
    }
	
	private func setupHandlerDidTapPushNotificationService(){
		handlerDidTapPushNotificationService.presentAdvertising = { [weak self] pushModel in
			guard let self = self else { return }
            createAdvertisingScreenVCService.createVC(with: pushModel) { [weak self] viewController in
				guard let self = self else { return }
				guard let viewController = viewController else { return }
				self.timer?.invalidate()
				self.timer = nil
				AmplitudeEventConstants.ON_MINDBOX_PUSH_CLICK.pushEvent()
				self.presentAdvertising(with: viewController)
			}
            createAdvertisingScreenVCService.completionTimer.sink { [weak self] _ in
                self?.timer?.invalidate()
                self?.timer = nil
            }.store(in: &self.anyCancel)
		}
	}
	
    private func updateParameters(){
        var parameters: [String: String] = [:]
        parameters.updateValue(self.mindboxService.deviceToken, forKey: "a_ssid")
        parameters.updateValue(self.mindboxService.deviceUUID, forKey: "mb_uuid")
        parameters.updateValue("1", forKey: "app_type")
        self.advertisingFeature.updateParameters(with: parameters)
    }
	
    private func setupPush(){
        if let pushModel = handlerDidTapPushNotificationService.pushModel {
            createAdvertisingScreenVCService.createVC(with: pushModel) { [weak self] viewController in
				guard let self = self else { return }
				guard let viewController = viewController else { return }
				AmplitudeEventConstants.ON_MINDBOX_PUSH_CLICK.pushEvent()
				self.presentAdvertising(with: viewController)
			}
            createAdvertisingScreenVCService.completionTimer.sink { [weak self] _ in
                self?.timer?.invalidate()
                self?.timer = nil
            }.store(in: &self.anyCancel)
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.updateParameters()
                self.advertisingFeature.presentAdvertising(
                    requestData: self.advertisingRequestData) { presentScreen in
                        DispatchQueue.main.async {
                            switch presentScreen {
                            case .advertising(let view):
                                self.presentAdvertising(with: view)
                            default:
                                self.presentTabBar()
                            }
                        }
                        self.timer?.invalidate()
                    }
            }
        }
    }
    
    private func setupProgress(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            self.viewProperties?.progressValue += 0.005
            self.state = .updateViewProperties
            guard let progressValue = self.viewProperties?.progressValue else { return }
            guard progressValue > 1 else { return }
            self.setupPush()
            self.viewProperties?.progressValue = 0
            self.state = .updateViewProperties
        }
    }
    
    private func subscribeClose(){
        advertisingFeature.closeAction.sink { isClose in
            guard isClose else { return }
            self.routerService.dismiss(animated: true) { [weak self] in
                self?.presentTabBar()
            }
        }
        .store(in: &anyCancel)
    }
    
    private func presentAdvertising(with viewController: UIViewController){
        Orientation.lockOrientation(.all)
        self.timer?.invalidate()
        self.timer = nil
        self.routerService.present(
            with: .viewController(viewController)) {
                self.subscribeClose()
            }
    }
    
    private func createAdvertisingScreenVC(
        with pushModel: HandlerDidTapPushNotificationService.PushModel
    ) -> AdvertisingScreenViewController {
        let requestDataModel = RequestDataModel(
            schemeAdvertising: pushModel.clickUrl?.scheme ?? "",
            hostAdvertising: pushModel.clickUrl?.host ?? "",
            pathAdvertising: "",
            titleAdvertising: "",
            homeUrl: pushModel.homeUrl,
            isAdvertising: true,
            isClose: false,
            isCopyUrl: false,
            isTestPresent: false
        )
        var advertisingModel = AdvertisingModel(
            requestDataModel: requestDataModel
        )
        advertisingModel.urlAdvertising = pushModel.clickUrl
        let viewController = self.advertisingFeature.createAdvertisingScreenVC(with: advertisingModel)
        return viewController
    }
    
    private func presentTabBar(){
        Orientation.lockOrientation(.portrait)
        //TabBar
        let mainTabBarBuilder = MainTabBarScreenViewControllerBuilder.build()
        mainTabBarScreenViewManager = mainTabBarBuilder.viewManager
        mainTabBarScreenViewManager?.state = .createViewProperties
        //NavBar
        let mainNavBarBuilder = MainNavBarScreenViewControllerBuilder.build(
            with: mainTabBarBuilder.view
        )
        mainNavBarBuilder.viewManager.state = .createViewProperties
        routerService.setupNavigationVC(
            with: mainNavBarBuilder.view
        )
        //Set root vc
        routerService.present(
            with: .viewController(mainNavBarBuilder.view)
        )
    }
}
