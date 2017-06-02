//
//  EpisodeTableViewCell.swift
//  AppOcalypse
//
//  Created by Yvan Moté on 31/05/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import UIKit
import Haneke

class EpisodeTableViewCell: UITableViewCell {

	enum Style {
		case one, two
	}
	
	static let identifier = "episode_cell_identifier"
	
	@IBOutlet weak var episodeImageView: UIImageView!
	@IBOutlet weak var episodeNameLabel: UILabel!
	
	var episode: Episode! {
		
		// didSet = observateur qui sera déclenché lorsque l'on modifiera
		// la variable
		didSet {
			// Refresh UI
			episodeNameLabel.text = episode.name
			if let url = URL(string: episode.thumbnailImageUrl) {
				episodeImageView.hnk_setImageFromURL(url)
			}
		}
	}
	
	var style: Style! {
		didSet {
			if let currentStyle = style {
				switch currentStyle {
				case .one:
					self.contentView.backgroundColor = UIColor.lightGray
					break
				case .two:
					self.contentView.backgroundColor = UIColor.darkGray
					break
				default:
					break
				}
			}
			
			
		}
	}
	
	
	
	

}
