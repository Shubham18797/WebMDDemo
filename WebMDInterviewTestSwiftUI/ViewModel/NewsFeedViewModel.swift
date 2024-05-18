//
//  NewsFeedViewModel.swift
//  WebMDInterviewTestSwiftUI
//
//  Created by Ramadugu, Akshith on 1/17/24.
//

import Foundation
import Combine

class NewsFeedViewModel: ObservableObject {
    
    @Published var newsArr: [NewsArticle] = []
    
    // Function to load news feed
    func loadNewsFeed() {
        // fetchNews and handle its response
        // Please show only the first 25 articles
        
        NewsAPI.fetchNews {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let arr):
                    self?.newsArr = Array(arr.prefix(25))
                    
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.newsArr = []
                }
            }
        }
    }
}

