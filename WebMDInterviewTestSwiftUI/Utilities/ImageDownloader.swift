//
//  ImageDownloader.swift
//  WebMDInterviewTestSwiftUI
//
//

import Foundation
import UIKit


class ImageDownloader: ObservableObject {
    
    @Published var downloadedImage: UIImage?
    
    private var imagePath: String
    
    
    init(imageUrl: String) {
        self.imagePath = imageUrl
        self.getImage()
    }
    
    func getImage() {
        
        guard let url = URL(string: self.imagePath) else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: urlRequest) {[weak self] data, response, error in
            if (error == nil && data != nil) {
                DispatchQueue.main.async {
                    self?.downloadedImage = UIImage(data: data!)
                }
            }
        }.resume()
    }
    
}
