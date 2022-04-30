//
//  ImageCache.swift
//  Brewdog
//
//  Created by Andrii Momot on 30.04.2022.
//

import UIKit

final class ImageCache {
    private let cache = NSCache<NSString, UIImage>()
    private var observer: NSObjectProtocol?
    
    static let shared = ImageCache()
    
    // Remove all cached objects if receive mamory warning
    private init() {
        observer = NotificationCenter.default.addObserver(
            forName: UIApplication.didReceiveMemoryWarningNotification,
            object: nil, queue: nil) { [weak self] notification in
                self?.cache.removeAllObjects()
        }
    }
    
    deinit {
        guard let observer = observer else { return }
        NotificationCenter.default.removeObserver(observer)
    }
    
    func getImage(forKey key: String) -> UIImage? {
        return cache.object(forKey: key as NSString)
    }
    
    func save(image: UIImage, forKey key: String) {
        cache.setObject(image, forKey: key as NSString)
    }
}
