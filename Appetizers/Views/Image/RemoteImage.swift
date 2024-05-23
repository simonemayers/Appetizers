//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Owner on 5/23/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString urlString: String){
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            let uiImage = uiImage
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage: View {
    var image: Image?
    
    var body: some View {
        return image?.resizable() ?? Image(systemName: "fork.knife.circle.fill")
    }
}

struct AppetizerRemoteImage: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear{imageLoader.load(fromURLString: urlString) }
    }
}



