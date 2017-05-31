//
//  EpisodeTableViewCell.swift
//  AppOcalypse
//
//  Created by Yvan Moté on 31/05/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

	static let identifier = "episode_cell_identifier"
	
	@IBOutlet weak var episodeImageView: UIImageView!
	@IBOutlet weak var episodeNameLabel: UILabel!
	
	var episode: Episode! {
		
		// didSet = observateur qui sera déclenché lorsque l'on modifiera
		// la variable
		didSet {
			// Refresh UI
			episodeNameLabel.text = episode.name
			
			
		}
	}

}
