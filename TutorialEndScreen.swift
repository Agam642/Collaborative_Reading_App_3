//
//  TutorialEndScreen.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-06-19.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class TutorialEndScreen: UIViewController {
    @IBOutlet weak var menuImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        menuImage.alpha = 0.5
    
        let showGestureRecognizer:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(SideBar.handleSwipe(_:)))
        showGestureRecognizer.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(showGestureRecognizer)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
    }

    
    func handleSwipe(_ recognizer:UISwipeGestureRecognizer){
       print("SWIPED")
        self.performSegue(withIdentifier: "swipeSegue", sender: self)
    }

    
    func doubleTapped() {
        print("WOW GOOD JOB")
        self.performSegue(withIdentifier: "swipeSegue", sender: self)
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
