//
//  EpisodeDetailViewController.swift
//  AppOcalypse
//
//  Created by Yvan Moté on 02/06/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

	static let segueIdentifier = "segue_episode_detail"
	
	@IBOutlet weak var episodeImageView: UIImageView!
	@IBOutlet weak var episodeWebView: UIWebView!
	
	var episode: Episode!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// Templating -> affichage de l'épisode
		
		// Pour afficher le titre dans la navigation bar
		self.title = episode.name
		
		// Chargement de l'image (plus tard)
		
		/*
		episodeWebView.loadHTMLString(episode.summary,
		                              baseURL: nil)
		*/

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
