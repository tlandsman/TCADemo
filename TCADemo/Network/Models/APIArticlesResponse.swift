//
//  APIArticlesResponse.swift
//  TCADemo
//
//  Created by Tanya Landsman on 5/20/25.
//

import Foundation

struct APIArticlesResponse: Codable {
    let results: [APIArticle]
    
}

struct APIArticle: Codable {
    let title: String
    let byline: String
    let createdDate: Date
    
    enum CodingKeys: String, CodingKey {
        case title
        case byline
        case createdDate = "created_date"
    }
    
}
