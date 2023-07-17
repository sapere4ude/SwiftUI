//
//  Currency.swift
//  TravelMoneyBox
//
//  Created by Kant on 2023/07/16.
//

import Foundation

struct Currency {
    let code: String
    let rate: String
    
    var imageName: String {
        return code.lowercased()
    }
}
