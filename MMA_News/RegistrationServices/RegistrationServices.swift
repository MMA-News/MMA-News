//
//  RegistrationServices.swift
//  FruitSlots
//
//  Created by Game Developer on 17.11.2022.
//
import Router
import FirestoreSDK
import Resolver
import MindboxSDK
import AddScreen

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        self.application()
        self.simple()
    }
    
    private static func simple() {
        Resolver.register {
            TabBarControllersService()
        }
        
        Resolver.register {
            FirestoreService()
        }
        
        Resolver.register {
            CreateAdvertisingScreenVCService(
                advertisingFeature: Resolver.resolve(),
                mindboxService: Resolver.resolve()
            )
        }
        
        Resolver.register {
            GetRequestsFirebaseService(
                firestoreService: Resolver.resolve()
            )
        }
        
        Resolver.register {
            MainCollectionCellFactory()
        }
        
        Resolver.register {
            MainCollectionDataSources(
                mainCollectionCellFactory: Resolver.resolve()
            )
        }
        
        Resolver.register {
            MainCollectionDelegate(
                mainCollectionCellFactory: Resolver.resolve()
            )
        }
        
        Resolver.register {
            CalculateTimeService()
        }
        
        Resolver.register {
            MainCollectionCellFactory()
        }
        
        Resolver.register {
            WarningService()
        }
        
        Resolver.register {
            UserNotificationServiceDelegate(
                handlerDidTapPushNotificationService: Resolver.resolve()
            )
        }
        
        Resolver.register {
            UserNotificationService(
                userNotificationServiceDelegate: Resolver.resolve()
            )
        }
        
        Resolver.register {
            CreateAdvertisingScreenVCService(
                advertisingFeature: Resolver.resolve(),
                mindboxService: Resolver.resolve()
            )
        }
    }
    
    private static func application() {
        Resolver.register {
            RouterService()
        }
        .scope(.application)
        
        Resolver.register {
            NavBarFeature()
        }
        .scope(.application)
        
        Resolver.register {
            HandlerDidTapPushNotificationService()
        }
        .scope(.application)
        
        Resolver.register {
            AdvertisingFeature(
                devKey: "zgnKRCbyHh8k7AcFrCzh7E",
                appID: "6468948915"
            )
        }
        .scope(.application)
        
        Resolver.register {
            SDKMindboxService(
                endpointProduction: "T2xpbXBjb20uc3BvcnQubW1hLm5ld3M=",
                endpointDevelopment: "T2xpbXBjb20uc3BvcnQubW1hLm5ld3Mtc2FuZGJveA=="
            )
        }.scope(.application)
        
        Resolver.register {
            NewsFeature(
                getRequestsFirebaseService: Resolver.resolve(),
                routerService: Resolver.resolve(),
                navBarFeature: Resolver.resolve(),
                calculateTimeService: Resolver.resolve()
            )
        }
        .scope(.application)
        
        Resolver.register {
            MainFeature(
                getRequestsFirebaseService: Resolver.resolve(),
                routerService: Resolver.resolve(),
                navBarFeature: Resolver.resolve(),
                calculateTimeService: Resolver.resolve()
            )
        }
        .scope(.application)
        
        Resolver.register {
            TournamentsFeature(
                getRequestsFirebaseService: Resolver.resolve(),
                routerService: Resolver.resolve(),
                navBarFeature: Resolver.resolve(),
                warningService: Resolver.resolve()
            )
        }
        .scope(.application)
        
        Resolver.register {
            FightersFeature(
                getRequestsFirebaseService: Resolver.resolve(),
                routerService: Resolver.resolve(),
                navBarFeature: Resolver.resolve()
            )
        }
        .scope(.application)
        
        Resolver.register {
            TournamentsDetailFeature(
                getRequestsFirebaseService: Resolver.resolve(),
                routerService: Resolver.resolve(),
                warningService: Resolver.resolve()
            )
        }
        .scope(.application)
    }
}
