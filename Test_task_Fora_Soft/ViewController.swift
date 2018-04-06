//
//  ViewController.swift
//  Test_task_Fora_Soft
//
//  Created by ILYA VANEKHIN on 02.04.18.
//  Copyright © 2018 ILYA VANEKHIN. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var albums = [FullAlbum]()
    var albumForVC2: FullAlbum?
    var segueNew: UIStoryboardSegue?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        searchBar.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segueNew = segue
    }
    
}

extension ViewController: UISearchBarDelegate{
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let searchText = searchBar.text?.lowercased().addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        
        if searchBar.text != "" {
            let url = URL(string: "https://itunes.apple.com/search?term=\(searchText!.replacingOccurrences(of: " ", with: "+"))&entity=album")
            let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, _, _) in
                self.albums = ParserData.instance.getAlbumsFromItunes(data: data)
                self.collectionView.reloadData()
            })
            task.resume()
        }
        searchBar.resignFirstResponder()
    }
    
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! AlbumCell
        cell.inCellData(name: albums[indexPath.row].nameAlbum, img: (albums[indexPath.row].imageAlbum))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        albumForVC2 = albums[indexPath.row]
        (segueNew?.destination as! AlbumViewC).dataVC1 = albumForVC2
    }
    
    
}






