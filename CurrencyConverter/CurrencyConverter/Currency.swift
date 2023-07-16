//
//  Currency.swift
//  CurrencyConverter
//
//  Created by Kant on 2023/07/16.
//

import Foundation
import Alamofire

// https://api.exchangerate.host/latest?base=\(base)&amount\(input)

struct Currency: Codable {
    var success: Bool
    var base: String
    var date: String
    var rates = [String: Double]()
}

func apiRequest(url: String, completion: @escaping(Currency) -> ()) {
    Session.default.request(url).responseDecodable(of: Currency.self) { response in
        switch response.result {
        case .success(let currencies):
            print(currencies)
            completion(currencies)
        case .failure(let error):
            print(error.localizedDescription)
        }
    }
}
