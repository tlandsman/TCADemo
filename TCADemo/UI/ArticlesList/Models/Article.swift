//
//  Article.swift
//  TCADemo
//
//  Created by Tanya Landsman on 5/22/25.
//

// Represents a model of the Article for the UI that is distinct and separate from the API model
// This creates a separation from the network layer model

struct Article: Equatable {
    let title: String
    let byline: String
}
