//
//  LoginUtil.swift
//  AppOcalypse
//
//  Created by Yvan Moté on 02/06/2017.
//  Copyright © 2017 Neopixl. All rights reserved.
//

import Foundation
import KeychainAccess

class LoginUtil {
	
	typealias Credential = (username: String, password: String)
	
	private static let service		= "com.neopixl.appocalypse"
	private static let usernameKey	= "username"
	private static let passwordkey	= "password"
	
	static func isLoginSaved() -> Bool {
		return currentCredential() != nil
	}
	
	static func currentCredential() -> Credential? {
		let keychain = Keychain(service: service)
		
		if let username = keychain[usernameKey], let password = keychain[passwordkey] {
			return (username: username, password: password)
		}
		
		return nil
	}
	
	static func storeCredential(credential: Credential) {
		let keychain = Keychain(service: service)

		keychain[usernameKey] = credential.username
		keychain[passwordkey] = credential.password
	}
	
	
	
	
	
	
	
	
	
	
	
}
