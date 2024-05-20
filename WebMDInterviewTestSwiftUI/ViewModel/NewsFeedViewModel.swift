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
    @Published var isLoading: Bool = false
    
    // Function to load news feed
    func loadNewsFeed() {
//        // fetchNews and handle its response
//        // Please show only the first 25 articles
                
        print("Started loading news feed.")
        isLoading = true
        NewsAPI.fetchNews {[weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                print("Finished loading news feed.")
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

