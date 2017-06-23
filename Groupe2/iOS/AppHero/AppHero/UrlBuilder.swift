//
//  UrlBuilder.swift
//  AppHero
//
//  Created by savepanda on 23/06/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import Foundation

class UrlBuilder {
    
    // http://api.tvmaze.com/shows/73/episodes
    
    private static let baseUrl = "https://api.tvmaze.com/"
    
    static func allEpisodesUrl(showId: Int) -> String {
        return baseUrl+"shows/\(showId)/episodes"
    }
    
}
