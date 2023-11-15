//
//  RegistrationServices.swift
//  FruitSlots
//
//  Created by Game Developer on 17.11.2022.
//
import Router
import FirestoreSDK
import Resolver
import RoboKassaSDK

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
			UserIdService()
		}
		
        Resolver.register {
            FirestoreService()
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
			RoboKassaFeature()
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
				warningService: Resolver.resolve(),
				roboKassaFeature: Resolver.resolve(),
				userIdService: Resolver.resolve()
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
				warningService: Resolver.resolve(),
				roboKassaFeature: Resolver.resolve(), 
				userIdService: Resolver.resolve()
            )
        }
        .scope(.application)
    }
}
