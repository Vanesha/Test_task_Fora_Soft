//
//  AlbumViewC.swift
//  Test_task_Fora_Soft
//
//  Created by ILYA VANEKHIN on 05.04.18.
//  Copyright © 2018 ILYA VANEKHIN. All rights reserved.
//

import UIKit

class AlbumViewC: UIViewController {
    
    @IBOutlet weak var imgAlbum: UIImageView!
    @IBOutlet weak var copyrightText: UILabel!
    @IBOutlet weak var releaseDateText: UILabel!
    @IBOutlet weak var trackCountText: UILabel!
    @IBOutlet weak var genreText: UILabel!
    @IBOutlet weak var nameArtistText: UILabel!
    @IBOutlet weak var nameAlbumText: UILabel!
    
    var dataVC1: FullAlbum?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameAlbumText.text = self.dataVC1?.nameAlbum
        self.nameArtistText.text = self.dataVC1?.artistName
        self.genreText.text = self.dataVC1?.genreAlbum
        let trC:Int = (self.dataVC1?.trackCount)!
        self.trackCountText.text = String(trC)
        self.releaseDateText.text = self.dataVC1?.releaseDate
        self.copyrightText.text = self.dataVC1?.copyright
        let imgURL = URL(string: (dataVC1?.imageAlbum)!)
        let task = URLSession.shared.dataTask(with: imgURL!) { (data, _, _) in
            guard let dataImage = data else{return}
            DispatchQueue.main.async {
                self.imgAlbum.image = UIImage(data: dataImage)
            }
        }
        task.resume()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
