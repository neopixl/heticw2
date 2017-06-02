//
//  UIViewController+Util.swift
//  AppOcalypse
//
//  Created by Yvan Moté on 02/06/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
	
	// MARK: - Private methods
	
	public func showAlert(title: String, message: String) {
		let alertController = UIAlertController(title: title,
		                                        message: message,
		                                        preferredStyle: .alert)
		// UIAlertAction = bouton pour UIAlertController
		alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
		
		self.present(alertController, animated: true, completion: {
			print("alerte affichée")
		})
		
	}
}
