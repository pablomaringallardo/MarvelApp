//
//  NetworkManager.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import Foundation

enum Endpoint: String {
    case getHeros = "/characters"
    case getComic = "/comics/"
}

enum HttpMethods: String {
    case get = "GET"
    case post = "POST"
}

enum QueryItems: String {
    case apikey = "b14864a41460468c9771d8208d184f6b"
    case hash = "bb54cc16d49ded387870ebb180fc64c6"
    case ts = "1"
}

struct NetworkManager {
    
    let baseUrl = "https://gateway.marvel.com/v1/public"
    
    func getHeros(filterName: String) -> URLRequest {
        let url = URL(string: "\(baseUrl)\(Endpoint.getHeros.rawValue)")!
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        let queryItems = [
            URLQueryItem(name: "apikey", value: QueryItems.apikey.rawValue),
            URLQueryItem(name: "hash", value: QueryItems.hash.rawValue),
            URLQueryItem(name: "ts", value: QueryItems.ts.rawValue),
            filterName == "" ? nil : URLQueryItem(name: "nameStartsWith", value: filterName)
        ].compactMap {
            $0
        }
        
        components?.queryItems = queryItems
        
        var urlRequest: URLRequest?
        
        if let urlWithParams = components?.url {
            var request = URLRequest(url: urlWithParams)
            request.httpMethod = HttpMethods.get.rawValue
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest = request
        }
        
        return urlRequest!
    }
    
    func getSeriesComicsRequest(url: String) -> URLRequest {
        let url = URL(string: url)!
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        let queryItems = [
            URLQueryItem(name: "apikey", value: QueryItems.apikey.rawValue),
            URLQueryItem(name: "hash", value: QueryItems.hash.rawValue),
            URLQueryItem(name: "ts", value: QueryItems.ts.rawValue)
        ].compactMap {
            $0
        }
        
        components?.queryItems = queryItems
        
        var urlRequest: URLRequest?
        
        if let urlWithParams = components?.url {
            var request = URLRequest(url: urlWithParams)
            request.httpMethod = HttpMethods.get.rawValue
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            urlRequest = request
        }
        
        return urlRequest!
    }
}
