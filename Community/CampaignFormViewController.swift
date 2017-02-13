//
//  CampaignFormViewController.swift
//  Community
//
//  Created by Ibrahim Oyekan on 1/22/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import UIKit
import Eureka
import Foundation

class CampaignFormViewController: FormViewController {

  

            override func viewDidLoad() {
                super.viewDidLoad()
                
                form = Section("Campaign Title")
                    <<< TextRow(){ row in
                        row.title = "Campaign Title"
                    }
//                    <<< PhoneRow(){
//                        $0.title = "Phone Row"
//                        $0.placeholder = "And numbers here"
//                    }
                    +++ Section("Campaign Summary")
                    <<< TextRow(){ row in
                        row.cell.height = { 200 }
                        
                        
                }


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
