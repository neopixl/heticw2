//
//  Episode.swift
//  AppHero
//
//  Created by Yvan Moté on 21/06/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import Foundation
import SwiftyJSON

class Episode {
	var name: String!
    var summary: String!
    var thumbnail: String!  // Url
    var bigImage: String!   // Url
    
    var tvShowName = "The walking dead"
    
    var season: Int!
    var number: Int!
	
	init() {
		
	}
	
	init(name: String) {
		self.name = name
	}
	
}


// Parsing : accessible n'importe où dans notre projet
extension Episode {
    
    convenience init(json: JSON) {
        self.init()
        
        self.name = json["name"].stringValue
        self.summary = json["summary"].stringValue
        
        self.season = json["season"].intValue
        self.number = json["number"].intValue
        
        let thumbnailUrl = json["image"]["medium"].stringValue
        
        // Workaround 🤡
        self.thumbnail = thumbnailUrl.replacingOccurrences(of: "http://", with: "https://")

       
        self.bigImage = json["image"]["original"].stringValue
            .replacingOccurrences(of: "http://", with: "https://")
        
    }
    
}









