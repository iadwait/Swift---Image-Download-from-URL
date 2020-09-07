//
//  ViewController.swift
//  Image Download(from URL)
//
//  Created by Adwait Barkale on 07/09/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

//This is Code done manually, To use pod remove comments on line 12,30 and install SDWebImage Pod

import UIKit
//import SDWebImage

class ViewController: UIViewController {
    
    let strImageUrl = "https://iosacademy.io/assets/images/brand/icon.jpg"
    let imageView: UIImageView = {
        let iv = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        iv.backgroundColor = .gray
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageView.center = view.center
        view.addSubview(imageView)
        fetchImage(urlStr: strImageUrl)
        //imageView.sd_setImage(with: URL(string: strImageUrl), completed: nil)
    }
    
    func fetchImage(urlStr: String)
    {
        let url = URL(string: urlStr)
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { (data, _, error) in
            guard let imgData = data,error == nil else {
                return
            }
            DispatchQueue.main.async {
                let image = UIImage(data: imgData)
                self.imageView.image = image
            }
            
        }
        task.resume()
    }
    
}

