//
//  UIImageView+Extension.swift
//  RakutenTV
//
//  Created by JORDI GALLEN RENAU on 1/4/21.
//

import UIKit

extension UIImageView {
    func image(from urlString: String, placeHolderImage: UIImage) {
        if self.image == nil {
            self.image = placeHolderImage
        }
        guard let url = URL(string: urlString) else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                return
            }
            DispatchQueue.main.async {
                guard let data = data else { return }
                let image = UIImage(data: data)
                self.image = image
            }
        }.resume()
    }
}
