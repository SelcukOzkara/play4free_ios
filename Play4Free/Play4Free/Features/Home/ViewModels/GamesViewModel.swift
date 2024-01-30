//
//  GamesViewModel.swift
//  Play4Free
//
//  Created by Selcuk Özkara on 30.01.24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class GamesViewModel : ObservableObject {
    @Published var games = [Game]()
    
    init(){
        if games.isEmpty{
            fetchData()
        }
    }
    
    
    
    func fetchData(){
        Task {
            do{
                self.games = try await fetchGames()
            } catch {
                print("Anfrage fehlgeschlagen mit dem error: \(error)")
            }
        }
    }
    
    private func fetchGames() async throws -> [Game]{
        
        guard let url = URL(string: "https://www.freetogame.com/api/games") else {
            throw HTTPError.invalidURL
        }
        
        let (data,_) = try await URLSession.shared.data(from: url)
        
        let result = try JSONDecoder().decode([Game].self, from: data)
        
        return result
    }
    
}
