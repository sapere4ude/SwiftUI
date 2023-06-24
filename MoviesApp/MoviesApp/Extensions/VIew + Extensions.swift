//
//  VIew + Extensions.swift
//  MoviesApp
//
//  Created by Kant on 2023/06/24.
//

import Foundation
import SwiftUI

extension View {
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
}
