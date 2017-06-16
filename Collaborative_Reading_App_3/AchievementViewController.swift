//
//  AchievementViewController.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-06-15.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class AchievementViewController: UIViewController {

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
    
    
    @IBAction func closePopUp(_ sender: Any) {
        // when the clicks on close button it will call in the remove animate function
        self.removeAnimate()
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    /*
     
     
     To display the pop up view controller
     
     
     @IBAction func showPopup(_ sender: Any) {
     
     // links to the pop up view controller
     let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "sbPopUpID") as! PopUpViewController
     // adds the pop up view controller to itself
     self.addChildViewController(popOverVC)
     // displays the pop up view controller
     popOverVC.view.frame = self.view.frame
     self.view.addSubview(popOverVC.view)
     popOverVC.didMove(toParentViewController: self)
     
     }
 
 
 
 
 */
}
