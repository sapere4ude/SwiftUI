//
//  PokemonModel.swift
//  PokemonDemo
//
//  Created by Kant on 12/30/23.
//

import Foundation

struct PokemonPage: Codable {
    let count: Int
    let next: String
    let results: [Pokemon]
}

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "bulbasaur",
                                       url: "https://pokeapi.co/api/v2/pokemon/1/")
}

extension Pokemon {
    var imageUrl: String {
        "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(self.id).png"
    }

    var displayName: String {
        self.name.capitalized
    }
}

struct DetailPokemon: Codable {
    let id: Int
    let height: Int
    let weight: Int
}
