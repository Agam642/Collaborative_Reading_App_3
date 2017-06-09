//
//  Sample.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-06-05.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit
import CoreData

class Sample: UIViewController {

    @IBOutlet weak var avatarImage: UIImageView!

    @IBOutlet weak var ImageName: UILabel!
    
    /*
    func getData() {
        do {
            ImageName.text = try context.fetch(UserInfo.fetchRequest()) as? [NSManagedObject]
        } catch {
            print("Fetching Failed")
        }
    }
    
   */

   /*
    let request = NSFetchRequest<NSFetchRequestResult>(entityName: "UserInfo")
    
    request.returnsObjectsAsFaults = false
    
    do {
        let results = try context.fetch(request)
    
        if results.count > 0 {
    
            for result in results as! [UserInfo] {
    
                print(result.avatarClicked)
            }
        }
    }
    catch {
    //PROCESS ERROR
    }
 */

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // array to store the avatars
    var objects: [UserInfo] = []
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        
        
        do {
            objects = try context.fetch(UserInfo.fetchRequest())
            print("Fetched")
        } catch {
            print("Could not fetch")
        }
        
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
