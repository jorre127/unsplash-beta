//
//  NetworkService.swift
//  unsplash_beta
//
//  Created by Hannes Van den Berghe on 29/09/2022.
//

import Cara

public protocol NetworkService {
    func searchMovies(title: String, result: @escaping ((Result<[Movie]?, Error>) -> Void))
}

public class WebService: NetworkService {
    public func searchMovies(title: String, result: @escaping ((Result<[Movie]?, Error>) -> Void)) {
        let request = searchRequest(title: title)
        let serializer = CodableSerializer<ApiResponse>()
        service.execute(request, with: serializer) { response in
            switch response {
            case .success(let response):
                result(.success(response?.data.movies))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Properties

    static let shared = WebService()

    // MARK: Private

    internal let service: Service
    private let configuration: Configuration

    init(configuration: Configuration = UnsplashConfiguration(), service: Service? = nil) {
        self.configuration = configuration
        if let service = service {
            self.service = service
        } else {
            self.service = Service(configuration: configuration)
        }
    }
}
