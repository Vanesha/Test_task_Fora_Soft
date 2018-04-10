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
        var sorted = [FullAlbum]()
        
        guard let dataPage = data else{
            print("data")
            return sorted}
            
        guard let json = try? JSONSerialization.jsonObject(with: dataPage, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject else{
            print("json")
            return sorted}
            
        guard let albums = json["results"] as? NSArray else{return sorted}
        
        if albums.count == 0 {
            return sorted
        }
            
        else{
            for album in albums{
            
                guard let albumFinal = album as? [String : Any] else{return sorted}
                
                let temp = FullAlbum(_nameAlbum: albumFinal["collectionName"]! as! String,
                                 _imageAlbum: albumFinal["artworkUrl100"]! as! String,
                                 _artistName: albumFinal["artistName"] as! String,
                                 _copyright: albumFinal["copyright"] as? String,
                                 _currency: albumFinal["currency"] as! String,
                                 _releaseDate: albumFinal["releaseDate"] as! String,
                                 _genreAlbum:albumFinal["primaryGenreName"] as! String,
                                 _albumPrice: albumFinal["collectionPrice"] as! Float,
                                 _trackCount: albumFinal["trackCount"] as! Int)
            
                sorted.append(temp)
            }
            sorted = sorted.sorted{ $0.nameAlbum < $1.nameAlbum }
        }
        return sorted
    }
    
}


    

