//
//  AsyncImageWithURL.swift
//  Assingment
//
//  Created by Mitesh Rathore on 31/01/23.
//

import SwiftUI
import Combine

struct AsyncImageWithURL: View {
    private var maxWidth: CGFloat
    private var maxHeight: CGFloat
    private var url: URL?

    init(url: String?, maxWidth: CGFloat, maxHeight: CGFloat) {
        
            self.url = URL(string: url ?? "")
        self.maxHeight = maxHeight
        self.maxWidth = maxWidth
    }
    
    var body: some View {
        if let urlLink = self.url {
            URLImage(url: urlLink)
                .frame(maxWidth: maxWidth, maxHeight: maxHeight)
        } else {
            Image(systemName: "photo.artframe")
        }
    }
}




struct URLImage : View {

    init(url: URL) {
        remoteImage = RemoteImage(url: url)
        remoteImage.load()
    }

    var body: some View {
        ZStack {
            switch remoteImage.loadingState {
                case .initial:
                    EmptyView()
                case .inProgress:
                    ProgressView()
                case .success(let image):
                    image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                case .failure:
                Image(systemName: "photo.artframe")
            }
        }
    }

    @ObservedObject private var remoteImage: RemoteImage
}


