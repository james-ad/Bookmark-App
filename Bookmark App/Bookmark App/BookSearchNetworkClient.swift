//
//  BookSearchNetworkClient.swift
//  Bookmark App
//
//  Created by James Dunn on 5/28/22.
//

import Foundation
import Combine

struct ImageLink: Codable {
    var smallThumbnail: String
    var thumbnail: String
}

struct BookResult: Codable {
    var title: String
    var authors: [String]
    var imageLinks: ImageLink
}

struct VolumeInfo: Codable {
    var volumeInfo: BookResult
}

struct BookSearchResult: Codable {
    var items: [VolumeInfo]
}

struct BookSearchNetworkClient {
    static func performBookSearch(withText text: String) async -> BookSearchResult? {
        let searchQuery = text.components(separatedBy: " ").joined(separator: "+")
        // Create URL
        guard let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=\(searchQuery)&projection=lite&printType=books") else {
            print("Invalid URL")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try? JSONDecoder().decode(BookSearchResult.self, from: data)
            return response
        } catch (let error){
            print("Error parsing Book search. Error: \(error)")
        }
        return nil
    }
}
