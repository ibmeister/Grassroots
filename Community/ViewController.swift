//
//  ViewController.swift
//  Community
//
//  Created by Soya Diaoune on 1/21/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import UIKit
import Firebase
import FBSDKLoginKit
import FacebookCore
//import GooglePlaces


class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Sign in with email
        //        FIRAuth.auth()?.signIn(withEmail: "soyadiaoune@gmail.com", password: "password123", completion: { (FIRUser, Error) in
        //            print(Error)
        //        })
        
        
        //Sign Out
        //        let firebaseAuth = FIRAuth.auth()
        //        do {
        //            try firebaseAuth?.signOut()
        //        } catch let signOutError as NSError {
        //            print ("Error signing out: %@", signOutError)
        //        }
        
        let loginButton = FBSDKLoginButton()
        loginButton.delegate = self
        loginButton.center = view.center
        self.view.addSubview(loginButton)
        print("\n\nHello World\n\n")
        
        
        
        
        //google places
        //GMSPlacesClient.provideAPIKey("AIzaSyAAueRKiqueMBDPyyDqeQC5Y5T7fNKiuis")
        
    }
    
    
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error?) {
        if let error = error {
            print(error.localizedDescription)
            return
        }
        let credential = FIRFacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            // ...
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewController(withIdentifier: "campaignt")
//            self.present(vc, animated: true, completion: nil)
            FBSDKLoginManager().logOut()
            self.performSegue(withIdentifier: "segue1", sender: user)
            
        
            if let error = error {
                // ...
                return
            }
        }
        // ...
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
