//
//  MenuViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-05-23.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

class MenuViewController: UIViewController, SideBarDelegate {
    
    @IBOutlet weak var hellolbl: UILabel!
    
    @IBOutlet weak var avatarImage: UIImageView!
    
    
    var delegate:SideBarDelegate?
    var animator:UIDynamicAnimator!
    var isSideBarOpen:Bool = false
    
    let managedObjectContext = (UIApplication.shared.delegate
        as! AppDelegate).persistentContainer.viewContext
    
    let managedObjectContext2 = (UIApplication.shared.delegate
        as! AppDelegate).persistentContainer.viewContext
    
    var sideBar:SideBar = SideBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageView.image = UIImage(named: "image2")
        sideBar = SideBar(sourceView: self.view, menuItems: ["Home", "Library", "Achievements", "Calendar", "Credits"])
        sideBar.delegate = self
        
       /* let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
        */
    }
    /*func doubleTapped() {
        print("WOW GOOD JOB")
        SideBar().showSideBar(true)
        delegate?.sideBarWillOpen?()
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        let entityDescription =
            NSEntityDescription.entity(forEntityName: "UserInfo",
                                       in: managedObjectContext)
        
        //Saves and displays the name to the user
        let request: NSFetchRequest<UserInfo> = UserInfo.fetchRequest()
        request.entity = entityDescription
        
        do {
            var results = try managedObjectContext.fetch(request as!NSFetchRequest<NSFetchRequestResult>)
            
            if results.count > 0 {
                let match = results[results.count-2] as! NSManagedObject
                
                hellolbl.text = match.value(forKey: "name") as? String
                
                print(hellolbl.text)
                
            } else {
                print("Error in Name")
            }
            
        } catch {
            print("error")
        }
        
        //Saves the avatar image to core data
        let entityDescription2 =
            NSEntityDescription.entity(forEntityName: "UserInfo",
                                       in: managedObjectContext2)
        
        let request2: NSFetchRequest<UserInfo> = UserInfo.fetchRequest()
        request2.entity = entityDescription2
        
        do {
            var results2 = try managedObjectContext2.fetch(request2 as!NSFetchRequest<NSFetchRequestResult>)
            
            if results2.count > 0 {
                let match2 = results2[results2.count-1] as! NSManagedObject
                
                let imageName = match2.value(forKey: "avatarName") as? String
                
                avatarImage.image = UIImage(named: imageName!)
            } else {
                print("Error in Name")
            }
            
        } catch {
            print("error")
        }

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //References the story boards
    func sideBarDidSelectButtonAtIndex(_ index: Int) {
        
        //Storyboard 1
        let controller = storyboard?.instantiateViewController(withIdentifier: "MainScreen")
        self.addChildViewController(controller!)
        //view.addSubview((controller?.view)!)
        controller?.didMove(toParentViewController: self)
        
        //Storybaord 2
        let controller2 = storyboard?.instantiateViewController(withIdentifier: "Books")
        self.addChildViewController(controller2!)
        //view.addSubview((controller?.view)!)
        controller2?.didMove(toParentViewController: self)
        
        //Storybaord 3
        let controller3 = storyboard?.instantiateViewController(withIdentifier: "Timer")
        self.addChildViewController(controller3!)
        //view.addSubview((controller?.view)!)
        controller3?.didMove(toParentViewController: self)
        
        //Storybaord 4
        let controller4 = storyboard?.instantiateViewController(withIdentifier: "Timer")
        self.addChildViewController(controller4!)
        //view.addSubview((controller?.view)!)
        controller4?.didMove(toParentViewController: self)
        
        
        //Storybaord 5
        let controller5 = storyboard?.instantiateViewController(withIdentifier: "Timer")
        self.addChildViewController(controller5!)
        //view.addSubview((controller?.view)!)
        controller4?.didMove(toParentViewController: self)
        
        //Index created to move to the other storyboards upon selection of the idex 
        if index == 0 {
            view.addSubview((controller?.view)!)
        } else if index == 1 {
            view.addSubview((controller2?.view)!)
        } else if index == 2 {
            view.addSubview((controller3?.view)!)
        } else if index == 3 {
            view.addSubview((controller4?.view)!)
        } else if index == 4 {
            view.addSubview((controller5?.view)!)
        }
    }
    
}

