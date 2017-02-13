//
//  CampaignTableViewController.swift
//  Community
//
//  Created by Ibrahim Oyekan on 1/21/17.
//  Copyright © 2017 Soya. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase



class CampaignTableViewCell: UITableViewCell {
    
    @IBOutlet weak var postRating: UILabel!
    @IBOutlet weak var postSummary: UILabel!
    
}



class CampaignTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    
    
    @IBOutlet weak var tabView: UITableView!
    @IBOutlet weak var postTimestamp: UILabel!
    @IBOutlet weak var postUnstarred: UILabel!
    
    var postArray: [PostObject] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tabView.delegate = self
        tabView.dataSource = self
        self.tabView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        var ref: FIRDatabaseReference!
        DispatchQueue.main.async{
        ref = FIRDatabase.database().reference().child("posts")
        

        ref.queryOrdered(byChild: "rating").observe(.childAdded, with: { snapshot in
            
            let enumerator = snapshot.children
            let post = PostObject()
            
            while let child = enumerator.nextObject() as? FIRDataSnapshot {
                
                switch (child.key){
                case ("summary"):
                    print(child.value!)
                    post.summary = child.value as! String?
                case ("author"):
                    print(child.value!)
                    post.author = child.value as! String?
                case ("rating"):
                    print(child.value!)
                    post.rating = child.value as! Int?
                case ("subject"):
                    print(child.value!)
                    post.subject = child.value as! String?
                case ("text"):
                    print(child.value!)
                    post.text = child.value as! String?
                default: break
                }
            }
            self.postArray.append(post)
            
        })
        {(error) in
            print(error.localizedDescription)
        }
        
        
            self.tabView.reloadData()
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

//    override func numberOfSections(in tabView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }

   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return postArray.count
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height:90)
        
        DispatchQueue.main.async{
            self.postArray = self.sortPosts(sortPostArray: self.postArray)
            self.tabView.reloadData()
        }
    }
    
    func sortPosts(sortPostArray: [PostObject])-> [PostObject]{
        return sortPostArray.sorted(by: {$0.rating! > $1.rating!})
    }

    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "campaignCell", for: indexPath) as! CampaignTableViewCell
        cell.postSummary?.text = self.postArray[indexPath.item].summary
        
        if let pRating = self.postArray[indexPath.item].rating {
        cell.postRating?.text = String(pRating)
            
        }
        

        // Configure the cell...
        
        
        return cell
    }
    
//    class DashboardTabBarController: UITabBarController, UITabBarControllerDelegate {
//        override func viewDidLoad() {
//            super.viewDidLoad()
//            delegate = self
//        }
//        
//        override func viewWillAppear(_ animated: Bool) {
//            super.viewWillAppear(animated)
//            let item1 = CampaignTableViewController()
//            let icon1 = UITabBarItem(title: "Title", image: UIImage(named: "someImage.png"), selectedImage: UIImage(named: "otherImage.png"))
//            item1.tabBarItem = icon1
//            let controllers = [item1]
//            
//            self.viewControllers = controllers
//        }
//        
//        //Delegate methods
//        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
//            print("Should select viewController: \(viewController.title) ?")
//            return true;
//        }
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
