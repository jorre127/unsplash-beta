//
//  RandomPhotoRequest.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 29/09/2022.
//

import Cara

public struct searchRequest: Request {
    let title : String
    
    init (title: String) { self.title = title }
    
    public var url: URL? { return URL(string: "list_movies.json?query_term=" + title) }
    
    public var method: RequestMethod { return .get }
}
