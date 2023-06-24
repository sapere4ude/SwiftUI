//
//  ContentView.swift
//  MoviesApp
//
//  Created by Kant on 2023/06/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("wewewe")
            .onAppear {
                HTTPClient().getMoviesBy(search: "batman") { result in
                    switch result {
                    case .success(let movies):
                        print(movies)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
