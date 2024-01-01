//
//  PokemonManager.swift
//  PokemonDemo
//
//  Created by Kant on 12/30/23.
//

import Foundation

class PokemonManager {
    
//    func getPokemon() -> [Pokemon] {
//        let data: PokemonPage = Bundle.main.decode(file: "Pokemon.json")
//        let pokemon: [Pokemon] = data.results
//        
//        return pokemon
//    }
    
    // https://pokeapi.co/api/v2/pokemon?
    
//    func getPokemon() -> [Pokemon]? {
//        let url = URL(string: "https://pokeapi.co/api/v2/pokemon?")!
//        URLSession.shared.fetchData(for: url) { (result: Result<[PokemonPage], Error>) in
//            switch result {
//            case .success(let pokemon):
//                return pokemon.forEach { $0.results }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    func getPokemon(completion: @escaping ([Pokemon]?, Error?) -> Void) {
        let url = URL(string: "https://pokeapi.co/api/v2/pokemon")!
        
        URLSession.shared.fetchData(for: url) { (result: Result<PokemonPage, Error>) in
            switch result {
            case .success(let pokemonPage):
                // 성공 시 처리
                print("총 포켓몬 수: \(pokemonPage.count)")
                for pokemon in pokemonPage.results {
                    print("포켓몬 이름: \(pokemon.name), URL: \(pokemon.url)")
                }
                completion(pokemonPage.results, nil)
            case .failure(let error):
                // 실패 시 처리
                print("에러 발생: \(error)")
                completion(nil, error)
            }
        }
    }


    
    func getDetailedPokemon(id: Int, _ completion: @escaping (DetailPokemon) -> ()) {
        Bundle.main.fetchData(url: "https://pokeapi.co/api/v2/pokemon/\(id)/",
                              model: DetailPokemon.self) { data in
            completion(data)
        } failure: { error in
            print(error)
        }
    }
}
