//
//  NewsListView.swift
//  WebMDInterviewTestSwiftUI
//
//  Created by Ramadugu, Akshith on 1/17/24.
//

import SwiftUI

struct NewsListView: View {
    
    @ObservedObject var viewModel: NewsFeedViewModel
    
    var body: some View {
        NavigationView {
            // 1. Use a List to display news articles.
            // 2. Each article cell should show an image,title, and description.
            // 3. Implement navigation to a detail view on selection.
            
            List(viewModel.newsArr, id: \.id) { news in
                
                NavigationLink(destination: NewsArticleView(news: news)) {
                    HStack {
                        VStack {
                            Text(news.title ?? "").font(.title3).fontWeight(.bold).lineLimit(2)
                            Spacer().frame(height: 10)
                            Text(news.description ?? "").font(.subheadline).lineLimit(3)
                        }
                        Spacer()
                        
                        LazyImageView(imageUrl: news.urlToImage ?? "", width: 100, height: 100)
                        
                    }
                }
                
            }.listStyle(.plain)
                .navigationTitle("News")
                .onAppear(perform: {
                    viewModel.loadNewsFeed()
                })
        }
    }
}


#Preview {
    NewsListView(viewModel: NewsFeedViewModel())
}


