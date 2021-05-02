//
//  ViewController.swift
//  Project10-Challenge2
//
//  Created by Luciene Ventura on 25/04/21.
//

import UIKit

class ViewController: UICollectionViewController {
    
    var pictures =  [String]()
    
    var flagInitial = [InitialFlag]()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let flags = try! fm.contentsOfDirectory(atPath: path)
        
        for flag in flags {
            if flag.hasSuffix("png") {
                pictures.append(flag)
            }
        }
        
        title = "Flags"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =  collectionView.dequeueReusableCell(withReuseIdentifier: "Flag", for: indexPath) as? FlagCell else { fatalError("Unable")
        }
        
        cell.imageView.image = UIImage(named: pictures[indexPath.item])
        cell.imageView.layer.borderWidth = 1
        return cell
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            vc.selectedFlag = pictures[indexPath.item]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

