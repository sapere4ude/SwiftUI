//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by Kant on 2023/06/24.
//

import Foundation

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
