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
        
        let seachText = transformString(str: searchBar.text!)
        
        let url = URL(string: "https://itunes.apple.com/search?term=\(seachText)&entity=album")
        let task = URLSession.shared.dataTask(with: url!, completionHandler: { (data, _, _) in
            self.albums = ParserData.instance.getAlbumsFromItunes(data: data)
            if self.albums.count == 0 {
                let alertVC = UIAlertController(title: "Повторите запрос", message: "Ничего не найдено", preferredStyle: .alert)
                let actionOK = UIAlertAction(title: "Ok", style: .default, handler: { (_) in
                        
                })
                alertVC.addAction(actionOK)
                self.present(alertVC, animated: true, completion: {
                    print("")
                })
            }
            self.collectionView.reloadData()
                
        })
        task.resume()
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

func transformString(str: String) -> String{
    
    var strNew = str.lowercased().addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
    
    var count = 0
    var startChar: Character
    
    
    for char in (strNew?.characters)!{
        
        if char == " "{
            count += 1
        }
        else{
            startChar = char
            break
        }
    }
    
    let strWithoutStartSpace  = String(str.characters.dropFirst(count))
    let returnStr = strWithoutStartSpace.replacingOccurrences(of: " ", with: "+")
    return returnStr
}










