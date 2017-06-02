//
//  Episode.swift
//  AppOcalypse
//
//  Created by Yvan Moté on 31/05/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import Foundation
import SwiftyJSON

class Episode {
	
	var name: String!
	var summary: String!
	var thumbnailImageUrl: String!
	var originalImageUrl: String!
	
	init() {
		
	}
	
	init(name: String) {
		self.name = name
	}
	
}

extension Episode {
	
	convenience init(json: JSON) {
		self.init()
		
		self.name = json["name"].stringValue
		self.summary = json["summary"].stringValue
		self.thumbnailImageUrl = json["image"]["medium"].stringValue.replacingOccurrences(of: "http", with: "https")
		self.originalImageUrl = json["image"]["original"].stringValue.replacingOccurrences(of: "http", with: "https")
		
	}
	
	
	
}












