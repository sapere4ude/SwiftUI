//
//  RideType.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/03/26.
//

import Foundation

enum RideType: Int, CaseIterable, Identifiable {
    case uberX
    case black
    case uberXL
    
    var id: Int { return rawValue }
    
    var description: String {
        switch self {
        case .uberX: return "UberX"
        case .black: return "UberBlack"
        case .uberXL: return "UberXL"
        }
    }
    
    var imageName: String {
        switch self {
        case .uberX: return "Uber-x"
        case .black: return "Uber-black"
        case .uberXL: return "Uber-xl"
        }
    }
}
