//
//  CreateAdvertisingScreenVCService.swift
//  MMA_News
//
//  Created by carollynch on 21.10.2023.
//
import AddScreen
import MindboxSDK
import Foundation
import Combine
import FirebaseFirestore

struct CreateAdvertisingScreenVCService {
    
    private let advertisingFeature: AdvertisingFeature
    private let mindboxService: SDKMindboxService
    
    init(
        advertisingFeature: AdvertisingFeature,
        mindboxService: SDKMindboxService
    ) {
        self.advertisingFeature = advertisingFeature
        self.mindboxService = mindboxService
    }
    
    private let reference = Firestore.firestore()
    private var requestData: AdvertisingRequestData {
        var requestData = AdvertisingRequestData()
        requestData.documentReference = self.reference
            .collection("advertising_version_1.0")
            .document("configuration")
        return requestData
    }
    
    public var completionTimer = PassthroughSubject<Bool, Never>()
    
    private func updateParameters(){
        var parameters: [String: String] = [:]
        parameters.updateValue(self.mindboxService.deviceToken, forKey: "a_ssid")
        parameters.updateValue(self.mindboxService.deviceUUID, forKey: "mb_uuid")
        parameters.updateValue("1", forKey: "app_type")
        self.advertisingFeature.updateParameters(with: parameters)
    }
    
    private func createParameters() -> [String: String] {
        var parameters: [String: String] = [:]
        parameters.updateValue(self.mindboxService.deviceToken, forKey: "a_ssid")
        parameters.updateValue(self.mindboxService.deviceUUID, forKey: "mb_uuid")
        parameters.updateValue("1", forKey: "app_type")
        return parameters
    }
    
    func createVC(
        with pushModel: HandlerDidTapPushNotificationService.PushModel,
        completion: @escaping Closure<AdvertisingScreenViewController?>
    ){
        var requestDataModel: RequestDataModel?
        
        switch pushModel.pushType {
        case .homeReturnURL(let homeUrl, let clickUrlString):
            requestDataModel = RequestDataModel(
                schemeAdvertising: clickUrlString.scheme ?? "",
                hostAdvertising: clickUrlString.host ?? "",
                pathAdvertising: "",
                titleAdvertising: "",
                homeUrl: homeUrl,
                isAdvertising: true,
                isClose: false,
                isCopyUrl: true,
                isTestPresent: false
            )
            
            var advertisingModel = AdvertisingModel(
                requestDataModel: requestDataModel!
            )
            completionTimer.send(true)
            advertisingModel.urlAdvertising = URL.create(
                with: clickUrlString,
                parameters:  self.createParameters()
            )
            
            let viewController = self.advertisingFeature.createAdvertisingScreenVC(with: advertisingModel)
            completion(viewController)
            
        case .simple(let clickUrl):
            requestDataModel = RequestDataModel(
                schemeAdvertising:clickUrl.scheme ?? "",
                hostAdvertising: clickUrl.host ?? "",
                pathAdvertising: "",
                titleAdvertising: "",
                homeUrl: nil,
                isAdvertising: true,
                isClose: false,
                isCopyUrl: true,
                isTestPresent: false
            )
            
            var advertisingModel = AdvertisingModel(
                requestDataModel: requestDataModel!
            )
            completionTimer.send(true)
            
            advertisingModel.urlAdvertising = URL.create(
                with: pushModel.clickUrl,
                parameters:  self.createParameters()
            )
            let viewController = self.advertisingFeature.createAdvertisingScreenVC(with: advertisingModel)
            completion(viewController)
            
        case .telegram(let clickUrl):
            requestDataModel = RequestDataModel(
                schemeAdvertising:clickUrl.scheme ?? "",
                hostAdvertising: clickUrl.host ?? "",
                pathAdvertising: "",
                titleAdvertising: "",
                homeUrl: nil,
                isAdvertising: true,
                isClose: false,
                isCopyUrl: true,
                isTestPresent: false
            )
            
            var advertisingModel = AdvertisingModel(
                requestDataModel: requestDataModel!
            )
            completionTimer.send(true)
            
            advertisingModel.urlAdvertising = URL.create(
                with: pushModel.clickUrl
            )
            
            if let url = advertisingModel.urlAdvertising {
                UIApplication.shared.open(url)
            }
            
        case .addPath(let pathAdvertising):
          
            self.advertisingFeature.getURLAdvertising(requestData: requestData)
            { advertisingURL in
              
                switch advertisingURL {
                    
                case .advertising(let newRequestDataModel):
                    requestDataModel = RequestDataModel(
                        schemeAdvertising: newRequestDataModel.schemeAdvertising,
                        hostAdvertising: newRequestDataModel.hostAdvertising,
                        pathAdvertising: pathAdvertising,
                        titleAdvertising: newRequestDataModel.titleAdvertising,
                        homeUrl: pushModel.homeUrl,
                        isAdvertising: true,
                        isClose: false,
                        isCopyUrl: true,
                        isTestPresent: false
                    )
                    
                    var advertisingModel = AdvertisingModel(
                        requestDataModel: requestDataModel!
                    )
                    advertisingModel.urlAdvertising = URL.create(
                        with: requestDataModel!,
                        with: advertisingModel,
                        parameters: self.createParameters()
                    )
                    completionTimer.send(true)
                    
                    advertisingModel.urlAdvertising = advertisingModel.urlAdvertising?.appendingPathComponent(pathAdvertising)
                    let viewController = self.advertisingFeature.createAdvertisingScreenVC(with: advertisingModel)
                    completion(viewController)
                    
                case .error(let error):
                    print(error)
                    completion(nil)
                }
            }
            
        case .addPathHomeReturnURL(let homeUrl, let pathAdvertising):
          
            self.advertisingFeature.getURLAdvertising(requestData: requestData) {
                advertisingURL in
              
                switch advertisingURL {
                    
                case .advertising(let newRequestDataModel):
                    requestDataModel = RequestDataModel(
                        schemeAdvertising: newRequestDataModel.schemeAdvertising,
                        hostAdvertising: newRequestDataModel.hostAdvertising,
                        pathAdvertising: pathAdvertising,
                        titleAdvertising: newRequestDataModel.titleAdvertising,
                        homeUrl: homeUrl,
                        isAdvertising: true,
                        isClose: false,
                        isCopyUrl: true,
                        isTestPresent: false
                    )
                    
                    var advertisingModel = AdvertisingModel(
                        requestDataModel: requestDataModel!
                    )
                    advertisingModel.urlAdvertising = URL.create(
                        with: requestDataModel!,
                        with: advertisingModel,
                        parameters: self.createParameters()
                    )
                    advertisingModel.urlAdvertising = advertisingModel.urlAdvertising?.appendingPathComponent(pathAdvertising)
                    let viewController = self.advertisingFeature.createAdvertisingScreenVC(with: advertisingModel)
                    completion(viewController)
                    
                    completionTimer.send(true)
                    
                case .error(let error):
                    print(error)
                    completion(nil)
                    
                }
            }
        case .none:
            break
        }
    }
}
