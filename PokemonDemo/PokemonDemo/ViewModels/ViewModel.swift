//
//  ViewModel.swift
//  PokemonDemo
//
//  Created by Kant on 12/30/23.
//

import Foundation
import SwiftUI

final class ViewModel: ObservableObject {
    
    private let pokemonManager = PokemonManager()
    
    @Published var pokemonList = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemonList : pokemonList.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        //self.pokemonList = pokemonManager.getPokemon()
        
        pokemonManager.getPokemon { (pokemonPages, error) in
            if let pokemonPages = pokemonPages {
                // 성공적으로 데이터를 받았을 때의 처리
                
                self.pokemonList = pokemonPages
            } else if let error = error {
                // 에러가 발생했을 때의 처리
                print(error.localizedDescription)
            }
        }

    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemonList.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getDetails(pokemon: Pokemon) {
        let id = getPokemonIndex(pokemon: pokemon)
        
        pokemonManager.getDetailedPokemon(id: id) { data in
            DispatchQueue.main.async {
                self.pokemonDetails = data
            }
        }
    }
    
    func formatHW(value: Int) -> String {
        let doubleValue = Double(value)
        let string = String(format: "%.2f", doubleValue / 10)
        
        return string
    }
}

