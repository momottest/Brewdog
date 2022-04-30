//
//  API.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

protocol API {
    func send<T>(_ request: T, completion: @escaping (Result<T.Response, Error>) -> Void) where T: APIRequest
}
