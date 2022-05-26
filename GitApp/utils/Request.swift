//
//  Request.swift
//  GitApp
//
//  Created by Jean Carlo Hernández Arguedas on 26/5/22.
//

import Foundation

class Request {
    
    static func createWithToken(path: String) -> URLRequest {
        var urlRequest = self.create(path: path)
        urlRequest.addValue("Bearer \(Defaults.getToken())", forHTTPHeaderField: "Authorization")
        return urlRequest
    }
    
    static func create(path: String) -> URLRequest {
        return URLRequest(url:  URL(string: path)!)
    }
}
