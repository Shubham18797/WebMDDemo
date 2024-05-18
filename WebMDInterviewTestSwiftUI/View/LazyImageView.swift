//
//  LazyImageView.swift
//  WebMDInterviewTestSwiftUI
//
//

import SwiftUI

struct LazyImageView: View {
    
    @ObservedObject var imageDownloader: ImageDownloader
    
    var defaultImage: UIImage = UIImage(systemName: "photo")!
    let width: CGFloat
    let height: CGFloat
    
    
    init(imageUrl: String, width: CGFloat, height: CGFloat) {
        imageDownloader = ImageDownloader(imageUrl: imageUrl)
        self.width = width
        self.height = height
    }
    
    var body: some View {
        VStack {
            Image(uiImage: imageDownloader.downloadedImage ?? defaultImage)
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
        }
    }
}

#Preview {
    LazyImageView(imageUrl: "", width: 100, height: 100)
}
