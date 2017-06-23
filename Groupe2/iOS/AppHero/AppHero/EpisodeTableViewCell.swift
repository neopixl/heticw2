//
//  EpisodeTableViewCell.swift
//  AppHero
//
//  Created by Yvan Moté on 21/06/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import UIKit
import Haneke

class EpisodeTableViewCell: UITableViewCell {

	static let identifier = "episode_cell"
	
	@IBOutlet weak var episodeImageView: UIImageView!
	@IBOutlet weak var episodeLabel: UILabel!
	
	var episode: Episode! {
		didSet {
			// refresh UI
			episodeLabel.text = episode.name
            
            if let url = URL(string: episode.thumbnail) {
                episodeImageView.hnk_setImageFromURL(url)
            }
            
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
