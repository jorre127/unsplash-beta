//
//  Photo.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 29/09/2022.
//

import Foundation

public struct ApiResponse: Codable {
    var status: String
    var statusMessage: String
    var data: MovieResponse
    
    enum CodingKeys: String, CodingKey {
        case status
        case statusMessage = "status_message"
        case data
    }
}

public struct MovieResponse: Codable {
    var movieCount: Int
    var limit: Int
    var pageNumber: Int
    var movies : [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case movieCount = "movie_count"
        case limit
        case pageNumber = "page_number"
        case movies
    }
}

public struct Movie: Codable{
    var id: Int
    var url: String
    var imdbCode: String
    var title: String
    var titleLong: String
    var year: Int
    var rating: Double
    var runtime: Int
    var genres: [String]
    var summary: String
    var backgroundImage: String
    var smallCoverImage: String
    var mediumCoverImage: String
    var largeCoverimage: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case imdbCode = "imdb_code"
        case title
        case titleLong = "title_long"
        case year
        case rating
        case runtime
        case genres
        case summary
        case backgroundImage = "background_image"
        case smallCoverImage = "small_cover_image"
        case mediumCoverImage = "medium_cover_image"
        case largeCoverimage = "large_cover_image"
    }
    
}
