//
//  SignaturePad.swift
//  Collaborative_Reading_App_3
//
//  Created by Student on 2017-05-26.
//  Copyright © 2017 Student. All rights reserved.
//

import UIKit

class SignaturePad: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!

    var lastPoint = CGPoint.zero
    var swiped = false
    
    let alertController = UIAlertController(title: "Signature", message: "Please have your parent sign", preferredStyle: UIAlertControllerStyle.alert)
    
    let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default)
    {
        (result : UIAlertAction) -> Void in
        print("You pressed OK")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }

    
    // Reset button clears the image view
    @IBAction func resetButton(_ sender: Any) {
        self.imageView.image = nil
    }
    // Save button stores image in photo gallary
    @IBAction func saveButton(_ sender: Any) {
        if imageView.image == nil {
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
        else {
        UIImageWriteToSavedPhotosAlbum(imageView.image!, nil, nil, nil)
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = false
        
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
        }
    }
    
    // Draws lines on the screen as user moves thier finger
    func drawLines(fromPoint:CGPoint,toPoint:CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor)
        
        
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // Detects when user moves finger across screen
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        swiped = true
        
        if let touch = touches.first {
            let currentPoint = touch.location(in: self.view)
            drawLines(fromPoint: lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    // Detects when the user takes finger off screen
  override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            if !swiped {
                drawLines(fromPoint: lastPoint, toPoint: lastPoint)
            }
        }
    
        
   override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
/*      Core Data Attempt
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let task = SignatureInput(context: context) // Link Task & Context
        task.signature = taskTextField.text!
        
        // Save the data to coredata
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        UIImage *sampleimage = [UIImage imageNamed:imageView.image];
        
        NSData *dataImage = UIImageJPEGRepresentation(sampleimage, 0.0);
        Then finally save it
        
        [obj setValue:dataImage forKey:@"imageEntity"];
        
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

