//
//  MainFeature.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 19.02.2023.
//
import Router
import Foundation

final class MainFeature: BaseFeatureService<MainFeature> {
    
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
    
    var medias: [DECMedia] = []
    var news: [DECNew] = []
    var fighters: [DECFighter] = []
	var tournaments: [DECTournament] = []
    var mainNews: DECNew?
    var newsState: NewsState = .start
    
    // MARK: - private methods
    private var timer: Timer?
    
    // MARK: - override methods
    
    override func currentService() -> Self? {
        return self
    }
    
    // MARK: - public methods
    
    func getMedia(){
        getRequestsFirebaseService.getMedia { [weak self] firebaseResult in
            guard let self = self else { return }
            switch firebaseResult {
                    
                case .object(let medias):
                guard let medias = medias else { return }
                    self.medias = medias
                    self.notifySubscribers()
                case .error(let error):
                    print(error?.localizedDescription ?? "")
            }
        }
    }
    
    func getNews(){
        getRequestsFirebaseService.getNews { [weak self] firebaseResult in
            guard let self = self else { return }
            switch firebaseResult {
                    
                case .object(let news):
                guard let news = news else { return }
                    self.news = news
                    self.notifySubscribers()
                    self.setupTimerNews()
                    
                case .error(let error):
                    print(error?.localizedDescription ?? "")
            }
        }
    }
    
    func getFighters(){
        getRequestsFirebaseService.getFighters { firebaseResult in
            switch firebaseResult {
                    
                case .object(let fighters):
                    guard let fighters = fighters else { return }
                    self.fighters = fighters
                    self.notifySubscribers()
                case .error(let error):
                    print(error?.localizedDescription ?? "")
            }
        }
    }
	
	func getTournaments(){
		getRequestsFirebaseService.getTournaments { firebaseResult in
			switch firebaseResult {
					
				case .object(let tournaments):
					guard let tournaments = tournaments else { return }
					self.tournaments = tournaments
					self.notifySubscribers()
				case .error(let error):
					print(error?.localizedDescription ?? "")
			}
		}
	}
    
    private func timeDistance(with string: String) {
        let date = string.toDate(formatDate: .ddDotMMDotyyyy)
        if let days = calculateTimeService.distance(with: date) {
            let result = days + " Дней"
            self.newsState = .noStart(result)
        } else {
            self.newsState = .finish("Событие закончилось")
        }
    }
    
    // MARK: - private methods
    
    private func setupTimerNews(){
        self.timer = Timer.scheduledTimer(withTimeInterval: 7, repeats: true, block: { [weak self] _ in
            guard let mainNews = self?.news.shuffled().first else { return }
            self?.mainNews = mainNews
            self?.timeDistance(with: mainNews.date)
            self?.notifySubscribers()
        })
    }
}

enum MainCollectionType {
    case media
    case news
    case fighters
	case tournaments
}
