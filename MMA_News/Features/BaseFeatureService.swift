//
//  BaseFeatureService.swift
//  NEWS_MMA
//
//  Created by IOS Developer on 11.02.2023.
//
import Combine
import Foundation

class BaseFeatureService<Service>: NSObject {
    
    public typealias Subscriber = (Service) -> Void
    private var subscribers: [Subscriber] = []
    
    open var update = CurrentValueSubject<Bool, Never>(false)
    
    // нужно переопределить этот метод у наследника
    // и вернуть себя
    open func currentService() -> Service? {
        return nil
    }
    
    public func observeForUpdate(with subscriber: @escaping Subscriber) {
        subscribers.append(subscriber)
    }
    
    public func remove() {
        if let index = subscribers.firstIndex(where: {
            let currentService = String(describing: Mirror(reflecting: self).subjectType)
            let service = String(describing: Mirror(reflecting: $0).subjectType)
            return service.contains(currentService)
        }) {
            subscribers.remove(at: index)
        }
    }
    
    public func notifySubscribers() {
        guard let service = self.currentService() else { return }
        subscribers.forEach { subscriber in
            subscriber(service)
        }
    }
}
