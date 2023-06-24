//
//  MovieDetailView.swift
//  MoviesApp
//
//  Created by Kant on 2023/06/24.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movieDetailVM: MovieDetailViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                URLImage(url: movieDetailVM.poster)
                    .cornerRadius(10)
                Text(movieDetailVM.title)
                    .font(.title)
                Text(movieDetailVM.plot)
                Text("Director")
                    .fontWeight(.bold)
                Text(movieDetailVM.director)
                HStack {
                    Rating(rating: .constant(movieDetailVM.rating))
                    Text("\(movieDetailVM.rating)/10")
                }
                .padding(.top, 10)
                
                Spacer()
            }
            .padding()
            .navigationTitle(movieDetailVM.title)
        }
    }
}
