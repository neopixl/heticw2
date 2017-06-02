//
//  EpisodeService.swift
//  AppOcalypse
//
//  Created by Yvan Moté on 02/06/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UrlBuilder {
	static let baseUrl = "https://api.tvmaze.com/shows/"
	
	static func episodesUrl(idTvShow: Int) -> String {
		return baseUrl+"\(idTvShow)/episodes"
	}
}

// On définit la structure de nos callBacks 
// via des closures
typealias ResultEpisodes = (_ episodes: [Episode]) -> Void
typealias FailureEpisodes = (_ error: Error) -> Void


class EpisodeService {
	
	static func retrieveEpisodes(idTvShow: Int, success: @escaping ResultEpisodes,
	                             failure: @escaping FailureEpisodes) {
		
		let url = UrlBuilder.episodesUrl(idTvShow: idTvShow)
		
		// On envoie la requête
		Alamofire.request(url).responseJSON { (response) in
			switch response.result {
			case .success(let value):
				
				// Parsing à la main
				// utilisation de SwiftyJSON
				let jsonRoot = JSON(value)
				
				let jsonArray = jsonRoot.arrayValue
				
				var results = [Episode]()
				
				for jsonObject in jsonArray {
					// parsing d'un objet Episode
					results.append(Episode(json: jsonObject))
				}
				
				// On appelle notre callBack
				success(results)
				
				break
			case .failure(let error):
				
				failure(error)
				
				
				break
			}
		}
		
	}
	
}








