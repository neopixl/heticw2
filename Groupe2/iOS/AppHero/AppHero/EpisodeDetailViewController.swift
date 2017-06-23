//
//  EpisodeDetailViewController.swift
//  AppHero
//
//  Created by savepanda on 23/06/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import UIKit
import Haneke

class EpisodeDetailViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var tvShowTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seasonNumberLabel: UILabel!
 
    var episode: Episode!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addBlurToImageView()
        
        // Affichage du titre de l'épisode dans la navigation bar
        //self.title = episode.name
        
        
        tvShowTitleLabel.text = episode.tvShowName
        titleLabel.text = episode.name.uppercased()

        if let season = episode.season, let number = episode.number {
            seasonNumberLabel.text = "Saison \(season) | Ep. \(number)"
        }
        
        // Affichage de l'image 
        
        if let url = URL(string: episode.bigImage) {
            imageView.hnk_setImageFromURL(url)
        }
        
        //Affichage du contenu web
        
        webView.loadHTMLString(episode.summary, baseURL: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addBlurToImageView() {
        
        // Création d'un calque avec un flou
        
        let blurLayer = CAGradientLayer()
        
        let imageViewFrame = imageView.bounds
        
        imageView.layer.backgroundColor = UIColor.purple.cgColor
        
        // (x, y, width, height)
        
        let blurHeight = CGFloat(36.0)
        
        // Définition des proprités géométriques
        blurLayer.frame = CGRect(x: 0.0,
                                 y: 0.0,
                                 width: imageViewFrame.width, height: blurHeight)
        
        blurLayer.colors = [UIColor.clear.cgColor,
                            UIColor.white.cgColor]
        
        imageView.layer.addSublayer(blurLayer)

        blurLayer.position = CGPoint(x: imageViewFrame.width/2.0, y: imageViewFrame.height-blurHeight)
        
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
