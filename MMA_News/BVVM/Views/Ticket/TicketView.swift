//
//  TicketView.swift
//  MMA_News
//
//  Created by Senior Developer on 09.11.2023.
//
import UIKit
import Architecture

final class TicketView: UIView, ViewProtocol {
    
    struct ViewProperties {
       
    }
	
    var viewProperties: ViewProperties?
    
    func update(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
	
    func create(with viewProperties: ViewProperties?) {
        self.viewProperties = viewProperties
    }
}
