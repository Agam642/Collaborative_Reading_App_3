//
//  AchievementPopUpViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-06-12.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class AchievementPopUpViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // when the pop up view controller loads , it cause a background to be dark and transparent of the view controller that came before it
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
        
        // calls in the animate function
        self.showAnimate()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // function that will make the pop up view controller to transition in a "pop like" animation
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    // does the reverse of the above function
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    

    

}
