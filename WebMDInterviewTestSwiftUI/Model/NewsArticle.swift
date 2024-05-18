//
//  NewsArticle.swift
//  WebMDInterviewTestSwiftUI
//
//  Created by Ramadugu, Akshith on 1/17/24.
//

import Foundation

struct News: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [NewsArticle]
}

struct NewsArticle: Identifiable, Codable {
    var id = UUID()
    let title: String?
    let author: String?
    let description: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID()
        self.title = try container.decodeIfPresent(String.self, forKey: .title)
        self.author = try container.decodeIfPresent(String.self, forKey: .author)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage)
        self.publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
    }
    // Add other properties as needed based on the News API response.
}

