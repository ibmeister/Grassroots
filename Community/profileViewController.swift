//
//  profileViewController.swift
//  Community
//
//  Created by Soya Diaoune on 1/22/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    @IBOutlet var profilePic: UIImageView!
    @IBOutlet var name: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePic.clipsToBounds = true
        profilePic.layer.cornerRadius = (profilePic.bounds.height) / 2
        profilePic.layer.borderColor = UIColor.white.cgColor
        profilePic.layer.borderWidth = 1.2
        
        //self.view.backgroundColor = UIColor(red:0.65, green:0.84, blue:0.65, alpha:1.0)

        // Do any additional setup after loading the view.
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
