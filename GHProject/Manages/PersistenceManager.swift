//
//  PersistenceManager.swift
//  GHProject
//
//  Created by Софья Кравченко on 02.12.2024.
//

import UIKit

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    private static let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping(GFError?) -> Void) {
        retrieveFavorites { result in
            switch result {
            case .success(let favorites):
                var retrievedFavorites = favorites
                
                switch actionType {
                case .add:
                    guard !retrievedFavorites.contains(favorite) else {
                        completed(.AlreadyFavorite)
                        return
                    }
                    retrievedFavorites.append(favorite)
                case .remove:
                    retrievedFavorites.removeAll{ $0.login == favorite.login}
                }
                
                completed(save(favorites: retrievedFavorites))
                
            case .failure(let error):
                completed(error)
            }
        }
    }
    
    static func retrieveFavorites(completed: @escaping(Result<[Follower], GFError>) -> Void ){
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch{
            completed(.failure(.UnableFavorites))
        }
    }
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encoder = JSONEncoder()
            let encodedfavorites = try encoder.encode(favorites)
            defaults.setValue(encodedfavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .UnableFavorites
        }
    }
    
    
}
