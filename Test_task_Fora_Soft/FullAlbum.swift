//
//  FullAlbum.swift
//  Test_task_Fora_Soft
//
//  Created by ILYA VANEKHIN on 05.04.18.
//  Copyright © 2018 ILYA VANEKHIN. All rights reserved.
//

import Foundation

class FullAlbum{
    var nameAlbum: String = ""
    var imageAlbum: String = ""
    var artistName: String = ""
    var copyright: String? = ""
    var currency: String = ""
    var releaseDate: String = ""
    var genreAlbum: String = ""
    var albumPrice: Float = 0.0
    var trackCount: Int = 0
    
    
    init(_nameAlbum: String, _imageAlbum: String, _artistName : String, _copyright : String?, _currency : String, _releaseDate : String, _genreAlbum : String, _albumPrice : Float, _trackCount : Int) {
        nameAlbum = _nameAlbum
        imageAlbum = _imageAlbum
        artistName = _artistName
        copyright = _copyright
        currency = _currency
        releaseDate = _releaseDate
        genreAlbum = _genreAlbum
        albumPrice = _albumPrice
        trackCount = _trackCount
    }
    
    }

