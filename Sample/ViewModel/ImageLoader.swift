//
//  ImageLoader.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import Foundation
import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private var url: URL?
    
    init(url: URL?) {
        self.url = url
        loadImage()
    }
    
    func loadImage() {
        guard let url = url else { return }
        
        // 로컬 캐시에서 이미지를 로드합니다.
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent(url.lastPathComponent)
        
        if FileManager.default.fileExists(atPath: fileURL.path) {
            if let data = try? Data(contentsOf: fileURL) {
                self.image = UIImage(data: data)
                return
            }
        }
        
        // 캐시된 이미지가 없는 경우 원격 URL에서 이미지를 로드합니다.
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data, let loadedImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.image = loadedImage
                }
                
                // 로드된 이미지를 로컬에 저장합니다.
                do {
                    try data.write(to: fileURL)
                } catch {
                    print("Error saving image to local cache: \(error)")
                }
            }
        }.resume()
    }
}
