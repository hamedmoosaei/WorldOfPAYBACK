//
//  NetworkService.swift
//  WorldOfPAYBACK
//
//  Created by Hamed Moosaei on 11/22/22.
//

import Foundation
import RxSwift

protocol NetworkServer {
    func request<T: Decodable>() -> Observable<T>
}

struct NetworkService: NetworkServer {
    
    private let endPoint: EndPoint
    
    init(endPoint: EndPoint) {
        self.endPoint = endPoint
    }
    
    func request<T: Decodable>() -> Observable<T> {
        return Observable.just(endPoint.baseUrl)
            .flatMap { url -> Observable<Data> in
                let request = URLRequest(url: url)
                return URLSession.shared.rx.data(request: request)
            }.map { data -> T in
                return try JSONDecoder().decode(T.self, from: data)
            }
    }
}
