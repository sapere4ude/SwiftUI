//
//  MovieListView.swift
//  MoviesApp
//
//  Created by Kant on 2023/06/24.
//

import SwiftUI

struct MovieListView: View {
    
    let movies: [MovieViewModel]
    
    var body: some View {
        List(self.movies, id: \.imdbId) { movie in
            NavigationLink(destination: MovieDetailScreen(imdbId: movie.imdbId)) {
                MovieCell(movie: movie)
            }
        }
    }
}
