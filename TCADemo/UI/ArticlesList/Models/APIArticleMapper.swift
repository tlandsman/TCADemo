//
//  ArticleMapper.swift
//  TCADemo
//
//  Created by Tanya Landsman on 5/22/25.
//


extension Article {
    init(apiArticle: APIArticle) {
        self.init(
            title: apiArticle.title,
            byline: apiArticle.byline
        )
    }
}
