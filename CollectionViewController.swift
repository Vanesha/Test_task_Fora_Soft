//
//  CollectionViewController.swift
//  Test_task_Fora_Soft
//
//  Created by ILYA VANEKHIN on 03.04.18.
//  Copyright © 2018 ILYA VANEKHIN. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    var pars = Parser()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
       // return pars.albumDictionary.count
        return 10
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
    
        // Configure the cell
        cell.albumName.text = String(indexPath.row)
        return cell
    }

}
