//
//  EpisodeService.swift
//  AppHero
//
//  Created by savepanda on 23/06/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class EpisodeService {
    
    
    typealias ResultEpisodes = (_ episodes: [Episode]) -> Void
    typealias ErrorEpisodes = (_ code: Int) -> Void
    
    
    static func retrieveEpisodes(showId: Int, result: @escaping ResultEpisodes, failure: @escaping ErrorEpisodes) {
        
        let url = UrlBuilder.allEpisodesUrl(showId: showId)
        
        /*
 
         request(
         _ url: URLConvertible,
         method: HTTPMethod = .get,
         parameters: Parameters? = nil,
         encoding: ParameterEncoding = URLEncoding.default,
         headers: HTTPHeaders? = nil)
 
         */
        
        // Par défaut en GET
        Alamofire.request(url).responseJSON { (response) in
            
            switch response.result {
            case .success(let value):
                
                // Parsing JSON
                
                let jsonRoot = JSON(value) // ici c'est un Tableau
                
                var allEpisodes = [Episode]()
                
                for jsonObject in jsonRoot.arrayValue {
                    
                    // jsonObject -> Episode
                    
                    let episode = Episode(json: jsonObject)
                    allEpisodes.append(episode)
                    
                    
                    
                }
                
                result(allEpisodes)
                
                
                break
            case .failure(let error):
               
                failure(10)
                
                break
            }
            
            
            
            
            
            
            
            
        }
    }
    
    
    
    
    
    

}
