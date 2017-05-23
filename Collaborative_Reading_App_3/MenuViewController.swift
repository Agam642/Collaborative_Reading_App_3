//
//  MenuViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Saif Al-Din Ali on 2017-05-23.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, SideBarDelegate {
    
    @IBOutlet var imageView: UIImageView!
    
    var sideBar:SideBar = SideBar()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //imageView.image = UIImage(named: "image2")
        sideBar = SideBar(sourceView: self.view, menuItems: ["Home", "Name", "Start Reading", "Timer"])
        sideBar.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func sideBarDidSelectButtonAtIndex(_ index: Int) {
        
        //Storyboard 1
        let controller = storyboard?.instantiateViewController(withIdentifier: "Home")
        self.addChildViewController(controller!)
        //view.addSubview((controller?.view)!)
        controller?.didMove(toParentViewController: self)
        
        //Storybaord 2
        let controller2 = storyboard?.instantiateViewController(withIdentifier: "Name")
        self.addChildViewController(controller!)
        //view.addSubview((controller?.view)!)
        controller?.didMove(toParentViewController: self)
        
        //Storybaord 3
        let controller3 = storyboard?.instantiateViewController(withIdentifier: "StartReading")
        self.addChildViewController(controller!)
        //view.addSubview((controller?.view)!)
        controller?.didMove(toParentViewController: self)
        
        //Storybaord 4
        let controller4 = storyboard?.instantiateViewController(withIdentifier: "Timer")
        self.addChildViewController(controller!)
        //view.addSubview((controller?.view)!)
        controller?.didMove(toParentViewController: self)


        
        
        if index == 0{
            view.addSubview((controller?.view)!)
        } else if index == 1{
            view.addSubview((controller2?.view)!)
        } else if index == 2 {
            view.addSubview((controller3?.view)!)
        } else if index == 3 {
            view.addSubview((controller4?.view)!)
        }
    }
    
}

