//
//  ErrorMessage.swift
//  GHProject
//
//  Created by Софья Кравченко on 25.11.2024.
//

import Foundation

enum GFError: String, Error {
    
    case invalidUsername = "Invalid request"
    
    case unableToComplete = "Unable to complete your request. please, check your internet connection"
    
    case invalidResponse = "Invalid response from the server. Please6 try again"
    
    case invalidData     = "The data received from the server is invalid. Please, try again"
    
    case UnableFavorites = "Oops something went wrong. Please, try again"
    
    case AlreadyFavorite = "This user is already in list of favourite"
}
