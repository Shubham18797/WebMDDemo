//
//  NewsAPI.swift
//  WebMDInterviewTestSwiftUI
//
//  Created by Ramadugu, Akshith on 1/17/24.
//

import Foundation

struct NewsAPI {
    static let apiKey = "90cb3a480ee245afb759b8e17c6de0b8"
    static let baseURL = "https://newsapi.org"
    static let params = "/v2/everything?q=tesla&sortBy=publishedAt&apiKey="
    
    // Function to fetch news from the API
    static func fetchNews(completion: @escaping (Result<[NewsArticle], Error>) -> Void) {
        // 1. Construct the URL with the correct parameters.
        // 2. Perform a URLSession data task to fetch the news.
        // 3. Decode the JSON response into an array of NewsArticle.
        // 4. Call the completion handler with the fetched articles or an error.
        
        guard let url = URL(string: baseURL + params + apiKey) else {
            return
        }
        
        let urlRequest = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if (error == nil && data != nil) {
                let decoder = JSONDecoder()
                do {
                    let response = try decoder.decode(News.self, from: data!)
                    completion(.success(response.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
            else {
                completion(.failure(error!))
            }
        }.resume()
        
    }
}
