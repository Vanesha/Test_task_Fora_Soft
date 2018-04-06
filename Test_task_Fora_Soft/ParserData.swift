//
//  ParserData.swift
//  Test_task_Fora_Soft
//
//  Created by ILYA VANEKHIN on 03.04.18.
//  Copyright © 2018 ILYA VANEKHIN. All rights reserved.
//

import Foundation


class ParserData {
    
    static let instance = ParserData()
    
    
    func getAlbumsFromItunes(data: Data?) -> [FullAlbum]{
        var albumDictionary = [FullAlbum]()
        guard let dataPage = data else{return albumDictionary}
            
        guard let json = try? JSONSerialization.jsonObject(with: dataPage, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject else{return albumDictionary}
            
        guard let albums = json["results"] as? NSArray else{return albumDictionary}
            
        for album in albums{
            
            //test commit
            guard let albumFinal = album as? [String : Any] else{return albumDictionary}
                
            let temp = FullAlbum(_nameAlbum: albumFinal["collectionName"]! as! String,
                                 _imageAlbum: albumFinal["artworkUrl100"]! as! String,
                                 _artistName: albumFinal["artistName"] as! String,
                                 _copyright: albumFinal["copyright"] as! String,
                                 _currency: albumFinal["currency"] as! String,
                                 _releaseDate: albumFinal["releaseDate"] as! String,
                                 _genreAlbum:albumFinal["primaryGenreName"] as! String,
                                 _albumPrice: albumFinal["collectionPrice"] as! Float,
                                 _trackCount: albumFinal["trackCount"] as! Int)
            albumDictionary.append(temp)
        }
        let sorted = albumDictionary.sorted{ $0.nameAlbum < $1.nameAlbum }
        return sorted
    }
    
}


    

