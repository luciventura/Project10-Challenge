//
//  DetailViewController.swift
//  Project10-Challenge2
//
//  Created by Luciene Ventura on 01/05/21.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var selectedFlag: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedFlag
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(tapShare))
        
        if let imageToLoad = selectedFlag {
            imageView.image = UIImage(named: imageToLoad)
            imageView.layer.borderWidth = 1
            
        }
    }
    
    @objc func tapShare() {
        guard let image = imageView.image?.pngData()
        else {
            print ("no image")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, selectedFlag!], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}
