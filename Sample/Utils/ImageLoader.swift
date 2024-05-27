//
//  ImageLoader.swift
//  Sample
//
//  Created by Julian on 5/25/24.
//

import Foundation
import UIKit
import Combine
import Alamofire

class ImageLoader: ObservableObject {
    
    var subscription = Set<AnyCancellable>()
    
    @Published var image: UIImage? = nil
    @Published var loadingStatus: LoadingStatus = .loading
    
    private let imageUtil = ImageUtil.instance
    private let folderName = "news_images"
    private var imageUrl: String? = nil
    private var imageName: String = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    enum LoadingStatus: Int {
        case loading = 0
        case completion = 1
        case failure = 2
    }
    
    init(_imageUrl: String?) {
        
        self.imageUrl = _imageUrl
        /**
        * Http 연결 허용으로 변경해줌.
        if let url = _imageUrl, !url.isEmpty {
            if url.starts(with: "http") {
                self.imageUrl = url.replacingOccurrences(of: "http://", with: "https://")
            } else {
                self.imageUrl = nil
            }
        }
        */
        self.imageUrl = _imageUrl
        getImage()
    }
    
    // 이미지 데이터 가져오기
    private func getImage() {
        guard let url = imageUrl, !url.isEmpty, url.starts(with: "http") else {
            setLoadingStatus(_status: .failure)
            return
        }
        
        // 이미지 파일의 이름을 구분하기 위해 문자열 치환
        if let lastComponent = url.split(separator: "/").last {
            if let dotIndex = lastComponent.lastIndex(of: ".") {
                self.imageName = String(lastComponent.prefix(upTo: dotIndex))
            }
        }
        
        // 저장된 이미지가 있으면 Filemanager 에서 가져온다.
        if let savedImage = imageUtil.getImage(imageName: imageName, folderName: folderName) {
            image = savedImage
            setLoadingStatus(_status: .completion)
            print("Reuse image from File Manager.")
        }
        // 저장된 이미지가 없으면 다운로드 한다.
        else {
            downloadImage()
            print("Download image.")
        }
    }
    
    // 이미지 데이터 다운로드
    func downloadImage() {
        guard let url = imageUrl else {
            setLoadingStatus(_status: .failure)
            return
        }
        AF.request(url)
            .publishData()
            .compactMap { $0.data }
            .tryMap { data in
                guard let image = UIImage(data: data) else {
                    throw URLError(.badServerResponse)
                }
                return image
            }
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Image download completed")
                case .failure(let error):
                    print("Error downloading image: \(error)")
                }
            }, receiveValue: { [weak self] receivedValue in
                guard let self = self else { return }
                self.image = receivedValue
                self.imageUtil.saveImage(image: receivedValue, imageName: imageName, folderName: self.folderName)
                self.setLoadingStatus(_status: .completion)
            })
            .store(in: &cancellables)
    }
    
    /**
     * 0: loading, 1: completion, 2: failure
     */
    private func setLoadingStatus(_status: LoadingStatus) {
        self.loadingStatus = _status
    }
    
}
