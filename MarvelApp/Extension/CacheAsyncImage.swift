//
//  CacheAsyncImage.swift
//  MarvelApp
//
//  Created by Pablo Marín Gallardo on 17/11/23.
//

import Foundation

extension URLCache {
    
    static let imageCache = URLCache(memoryCapacity: 512_000_000, diskCapacity: 10_000_000_000)
}
