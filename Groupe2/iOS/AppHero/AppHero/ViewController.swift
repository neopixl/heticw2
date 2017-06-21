//
//  ViewController.swift
//  AppHero
//
//  Created by Yvan Moté on 21/06/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var loginTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	// MARK: - Private methods
	
	func showAlert(_ message: String) {
		let alertController = UIAlertController(title: "information", message: message, preferredStyle: .alert)
		
		alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler:nil))
		
		self.present(alertController, animated: true, completion: nil)
		
		
	}
	
	// MARK: - Action methods
	
	// sender = bouton qui a intercepté le tap
	@IBAction func signin(_ sender: Any) {
		
		if let login = loginTextField.text, let password = passwordTextField.text {
			
			let credentialsAreNotEmpty = !login.isEmpty && !password.isEmpty
			
			if credentialsAreNotEmpty {
				
				//showAlert("Vous êtes connecté !")
				
				// Pour charger le ViewController : EpisodesViewController
				if let episodesViewController = self.storyboard?.instantiateViewController(withIdentifier: EpisodesViewController.identifier) {
					self.present(episodesViewController, animated: true, completion: nil)
				}
				
				
				
			} else {
				
			}
			
		}
		
	}
	
	@IBAction func signup(_ sender: Any) {
		
	}
	
	
	
	
	


}

