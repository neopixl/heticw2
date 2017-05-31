//
//  EpisodesViewController.swift
//  AppOcalypse
//
//  Created by Yvan Moté on 31/05/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import UIKit

class EpisodesViewController: UIViewController {

	static let identifier = "episodes_detail_view_controller"
	
	lazy var allEpisodes = [Episode]()
	
	@IBOutlet weak var episodesTableView: UITableView!
	
	// Cette méthode est appelée quand la vue a été chargée (depuis le storyboard)
    override func viewDidLoad() {
        super.viewDidLoad()
		
		allEpisodes.append(Episode(name: "Les noces pourpres"))
		allEpisodes.append(Episode(name: "La mouche"))
		allEpisodes.append(Episode(name: "A new beginning"))
		allEpisodes.append(Episode(name: "Dragon rouge"))
		allEpisodes.append(Episode(name: "La chambre des secrets"))
		allEpisodes.append(Episode(name: "Les deux tours des présidentielles"))
		allEpisodes.append(Episode(name: "La peau dans la mémoire"))
		allEpisodes.append(Episode(name: "Harry un ami qui vous veut du bien"))
		allEpisodes.append(Episode(name: "The fate of the furious"))
		allEpisodes.append(Episode(name: "Lucky number Slevin"))
		allEpisodes.append(Episode(name: "Post Partum"))
		allEpisodes.append(Episode(name: "Go"))
		allEpisodes.append(Episode(name: "IP man"))
		allEpisodes.append(Episode(name: "Tick tick tick"))
		allEpisodes.append(Episode(name: "Reckoning"))
		allEpisodes.append(Episode(name: "The reign of Castamere"))
		
		
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

extension EpisodesViewController: UITableViewDataSource {
	
	
	// Spécifie à la TableView combien de cellules on affichera
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return allEpisodes.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		// Ne pas écrire, sous peine de sanctions ☠️
		
		let episodeCell = tableView.dequeueReusableCell(withIdentifier: EpisodeTableViewCell.identifier, for: indexPath) as! EpisodeTableViewCell
		
		let episode = allEpisodes[indexPath.row]
		
		episodeCell.episode = episode
		
		return episodeCell
	}
	
	
}

















