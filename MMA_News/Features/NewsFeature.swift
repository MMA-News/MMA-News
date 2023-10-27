//
//  NewsFeature.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 16.02.2023.
//
import Router
import Foundation

final class NewsFeature: BaseFeatureService<NewsFeature> {
    
    // MARK: - DI
    private let getRequestsFirebaseService: GetRequestsFirebaseService
    private let routerService: RouterService
    private let navBarFeature: NavBarFeature
    private let calculateTimeService: CalculateTimeService
    
    init(
        getRequestsFirebaseService: GetRequestsFirebaseService,
        routerService: RouterService,
        navBarFeature: NavBarFeature,
        calculateTimeService: CalculateTimeService
    ) {
        self.getRequestsFirebaseService = getRequestsFirebaseService
        self.routerService = routerService
        self.navBarFeature = navBarFeature
        self.calculateTimeService = calculateTimeService
    }
    
    // MARK: - public properties
    
    var news: [DECNew] = []
    var newsState: NewsState = .start
    
    // MARK: - private methods
   
    
    // MARK: - override methods
    
    override func currentService() -> Self? {
        return self
    }
    
    // MARK: - public methods
    
    func getNews(){
        getRequestsFirebaseService.getNews { firebaseResult in
            switch firebaseResult {
                    
                case .object(let news):
                guard let news = news else { return }
                    self.news = news.sorted(
                        by: {
                            $0.date.toDate(formatDate: .ddDotMMDotyyyy)! > $1.date.toDate(formatDate: .ddDotMMDotyyyy)!
                        }
                    )
                    self.notifySubscribers()
                case .error(let error):
                    print(error?.localizedDescription ?? "")
            }
        }
    }
    
    func timeDistance(with string: String) {
        let date = string.toDate(formatDate: .ddDotMMDotyyyy)
        if let days = calculateTimeService.distance(with: date) {
            let result = days + " Дней"
            newsState = .noStart(result)
        } else {
            newsState = .finish("Событие закончилось")
        }
        notifySubscribers()
    }
    
    func didTapNews(with indexPath: IndexPath) {
        let builder = NewsDetailScreenViewControllerBuilder.build()
        navBarFeature.hiddenBackButton(isHidden: false)
        let news = news[indexPath.row]
        builder.viewManager.state = .createViewProperties(news)
        routerService.pushMainNavigation(
            to: builder.view,
            animated: true
        )
    }
}

enum NewsState {
    case start
    case noStart(String)
    case finish(String)
}
