//
//  RandomPhotoRequest.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 29/09/2022.
//

import Cara

public struct RandomPhotoRequest: Request {
    public var url: URL? {
        return URL(string: "photos/random")
    }
    
    public var method: RequestMethod {
        return .get
    }
}
