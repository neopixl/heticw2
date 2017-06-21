//
//  EpisodesViewController.swift
//  AppHero
//
//  Created by Yvan Moté on 21/06/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController {

	static let identifier = "episodes_view_controller"
	
	@IBOutlet weak var episodesTableView: UITableView!
	
	lazy var allEpisodes = [Episode]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

		allEpisodes.append(Episode(name: "Les noces rouges"))
		allEpisodes.append(Episode(name: "La mouche"))
		allEpisodes.append(Episode(name: "La chenille ne tombe jamais seule"))
		allEpisodes.append(Episode(name: "Into the wild"))
		allEpisodes.append(Episode(name: "L'effet papillon"))
		allEpisodes.append(Episode(name: "La cité de la peur"))
		allEpisodes.append(Episode(name: "La Kotlin a des yeux"))
		allEpisodes.append(Episode(name: "Swifter, swifter"))
		allEpisodes.append(Episode(name: "OS X-files"))
		allEpisodes.append(Episode(name: "Le flic de Bel-air"))
		allEpisodes.append(Episode(name: "Qu'est-ce qu'on a fait au bon dieu?"))
		allEpisodes.append(Episode(name: "How Emett your mother?"))
		allEpisodes.append(Episode(name: "Big Bond Theory"))
		allEpisodes.append(Episode(name: "Les nouilles aux haricots noirs"))
		allEpisodes.append(Episode(name: "Merci Patron"))
		allEpisodes.append(Episode(name: "Old Boy"))
		allEpisodes.append(Episode(name: "Gone Girl"))
		
		
		
		
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

// On créé une extension pour gérer l'affichage des cellules
extension EpisodesViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return allEpisodes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let row = indexPath.row		// Index 0 -> allEpisodes.count-1
		
		// as! on force le cast
		let cell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.identifier,
		                                         for: indexPath) as! EpisodeTableViewCell
		
		let episode = allEpisodes[row]
		
		cell.episode = episode
		
		return cell
	}
	
	
}




