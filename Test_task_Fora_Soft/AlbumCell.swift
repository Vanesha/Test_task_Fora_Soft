//
//  CollectionViewCell.swift
//  Test_task_Fora_Soft
//
//  Created by ILYA VANEKHIN on 03.04.18.
//  Copyright © 2018 ILYA VANEKHIN. All rights reserved.
//

import UIKit

class AlbumCell: UICollectionViewCell {
    
    @IBOutlet weak var albumTextLabel: UILabel!
    @IBOutlet weak var imageAlbum: UIImageView!
    
    func inCellData(name: String, img: String){
        
        let imgURL = URL(string: img)
        let task = URLSession.shared.dataTask(with: imgURL!) { (data, _, _) in
            guard let dataImage = data else{return}
            DispatchQueue.main.async {
                self.imageAlbum.image = UIImage(data: dataImage)
            }
        }
        task.resume()
        albumTextLabel.text = name
        //test commit
        
    }
    
}
