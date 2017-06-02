//
//  ViewController.swift
//  AppOcalypse
//
//  Created by Yvan Moté on 31/05/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	static let identifier = "login_view_controller"
	
	@IBOutlet weak var textFieldUserName: UITextField!
	@IBOutlet weak var textFieldPassWord: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - Action methods
	
	@IBAction func signIn(_ sender: Any) {
		
		guard let username = textFieldUserName.text, let password = textFieldPassWord.text else {
			
			showAlert(title: "Erreur", message: "Vous n'avez pas dit le magique.")
			
			return
		}
		
		if username.isEmpty || password.isEmpty {
			showAlert(title: "Erreur", message: "Veuillez remplir le nom d'utilisateur et le mot de passe, s'il vous plaît ?")
		} else {
			
			LoginUtil.storeCredential(credential: (username: username, password: password))
			
			// Afficher la vue Liste des épisodes
			
			// 1 - Instancier le ViewController
			
			if let episodesViewController = self.storyboard?.instantiateViewController(withIdentifier: EpisodesViewController.identifier) {
				
				// 2 - Affichage du ViewController de manière modale
				self.show(episodesViewController, sender: nil)
			}
			
		}
		
		
		/*
		if let username = textFieldUserName.text, let password = textFieldPassWord.text {
			// Ici on a une valeur. 
			// Attention cette valeur peut-être vide
			
			// Les valeurs sont disponibles seulement à l'intérieur du if
		}
		*/
		
	}
	
	@IBAction func signUp(_ sender: Any) {
		
	}


}

