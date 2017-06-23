//
//  EpisodeDetailViewController.swift
//  AppHero
//
//  Created by savepanda on 23/06/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    
    var episode: Episode!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Affichage du titre de l'épisode dans la navigation bar
        self.title = episode.name
        
        // Affichage de l'image 
        
        //Affichage du contenu web
        
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
