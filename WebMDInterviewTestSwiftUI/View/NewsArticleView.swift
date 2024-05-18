//
//  NewsArticleView.swift
//  WebMDInterviewTestSwiftUI
//
//  Created by Ramadugu, Akshith on 1/17/24.
//

import SwiftUI

struct NewsArticleView: View {
    
    var news: NewsArticle
    
    var body: some View {
        
        ScrollView {
            // Display the article's image at the top (if available).
            // Show the article's title.
            // Show the full description of the article.
            // Style the view to ensure it is user-friendly and matches the design aesthetic.
            // Optionally, add more elements or information as needed.
            
            VStack(alignment: .leading) {
                Text(news.title ?? "").font(.title).fontWeight(.bold)
                Spacer().frame(height: 20)
                Text("By \(news.author ?? "")").font(.subheadline).foregroundStyle(.gray)
                Text("Published at \(Date.toString(ipDateStr: news.publishedAt ?? ""))").font(.subheadline).foregroundStyle(.gray)
                Spacer().frame(height: 20)
                LazyImageView(imageUrl: news.urlToImage ?? "", width: UIScreen.main.bounds.width - 40, height: 200)
                Spacer().frame(height: 20)
                Text(news.description ?? "").font(.subheadline)
                Text(news.content ?? "").font(.subheadline)
                
            }.padding()
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

