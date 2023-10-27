//
//  Extension + TypeLink.swift
//  DgBetTrip
//
//  Created by IOS Developer on 03.05.2020.
//
import Foundation

//Type link
extension String {
  
  static func typeLink(_ link: TypeLink) -> String {
    return link.rawValue
  }
  enum TypeLink: String {
    case diego         = "@DiegoGarcia"
    case obuchenie     = "obuchenie"
    case instruction   = "instruction"
    case serialWebView = "https://vk.cc/9zKp9p"
  }
  static func contains(_ text: Contains) -> String {
    return text.rawValue
  }
  enum Contains: String {
    case dgb = "@dgb"
  }
}
