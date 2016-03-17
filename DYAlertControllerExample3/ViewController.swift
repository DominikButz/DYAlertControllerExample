//
//  ViewController.swift
//  DYAlertControllerExample3
//
//  Created by Dominik Butz on 16/03/16.
//  Copyright © 2016 Duoyun. All rights reserved.
//

import UIKit
import DYAlertController

class ViewController: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        @IBAction func alertExample1Tapped(sender: UIButton) {
    
    
            let titleImage = UIImage(named: "shareIcon")
            let alert = DYAlertController(style: .Alert, title: "Doing stuff1 stuff2 stuff3 stuff4", titleIconImage: titleImage, message:"Select one option. Lorem ipsum. Gaudeamus igitur. Cogito ergo sum. In vino veritas. .. Carthaginem esse delendam.", cancelButtonTitle: "Cancel", okButtonTitle: nil, multipleSelection: false, customFrameWidth:200, backgroundEffect: DYAlertController.EffectViewMode.blur)
            
 
            
    
            alert.addAction(DYAlertAction(title: "Do stuff 1", style:.Default, iconImage: nil, setSelected:false, handler: { (alertAction) -> Void in
    
               // print("executing first action! selected: \(alertAction.selected)")
            }))
    
            alert.addAction(DYAlertAction(title: "Do stuff 2", style:.Default, iconImage: nil, setSelected:false, handler: { (alertAction) -> Void in
    
               // print("executing 2nd action! selected: \(alertAction.selected)")
    
            }))
    
    
            alert.addAction(DYAlertAction(title: "Beware!", style:.Destructive, iconImage: nil, setSelected:true, handler: { (alertAction) -> Void in
    
    
               // print("executing 3rd action! selected: \(alertAction.selected)")
    
            }))
            
            
    
            alert.handleCancelAction = {
    
              //  print("cancel tapped")
            }
    
            alert.handleOKAction = {
    
              //  print("OK button tapped")
            }
    
    
            self.presentViewController(alert, animated: true, completion: nil)
    
        }
    
    
    
        @IBAction func alertExample2Tapped(sender: UIButton) {
    
            let titleImage = UIImage(named: "shareIcon")
            let alert = DYAlertController(style: .Alert, title: "Edit Title", titleIconImage: titleImage, message: "Type in a new title", cancelButtonTitle: "Cancel", okButtonTitle: "OK", multipleSelection: false, customFrameWidth:180.0, backgroundEffect: DYAlertController.EffectViewMode.dim)
    
            alert.addTextField(nil)
            alert.textField!.delegate = self
    
    
            alert.handleCancelAction = {
    
               // print("cancel tapped")
            }
    
            alert.handleOKAction = {
    
               // print("OK button tapped. text field text: \(alert.textField!.text)")
            }
            
            
    
            self.presentViewController(alert, animated: true, completion: nil)
    
        }
    
    
        @IBAction func actionSheetExample1Tapped(sender: UIButton) {
    
            let titleImage = UIImage(named: "shareIcon")
            let actionSheet = DYAlertController(style: .ActionSheet, title: "Doing stuff", titleIconImage: titleImage, message:"Select one option", cancelButtonTitle: "Cancel", okButtonTitle: "Do it!", multipleSelection: false, customFrameWidth:200.0, backgroundEffect:.dim)
    
    
            actionSheet.addAction(DYAlertAction(title: "Do stuff 1", style:DYAlertAction.ActionStyle.Default, iconImage: UIImage(named: "eyeIcon"), setSelected:true, handler: { (alertAction) -> Void in
    
               // print("changing stat of first option.  selected: \(alertAction.selected)")
            }))
    
            actionSheet.addAction(DYAlertAction(title: "Do stuff 2", style:DYAlertAction.ActionStyle.Default, iconImage: UIImage(named: "locationIcon"), setSelected:false, handler: { (alertAction) -> Void in
    
              //  print("changing state of 2nd option. selected: \(alertAction.selected)")
    
            }))
    
    
            actionSheet.addAction(DYAlertAction(title: "Beware!", style:DYAlertAction.ActionStyle.Destructive, iconImage: UIImage(named: "eyeIcon"), setSelected:false, handler: { (alertAction) -> Void in
    
    
              //  print("changing state of 3rd option. selected: \(alertAction.selected)")
    
            }))
    
            actionSheet.handleCancelAction = {
    
             //   print("cancel tapped")
            }
    
            actionSheet.handleOKAction = {
    
             //   print("OK button tapped")
            }
    
    
            self.presentViewController(actionSheet, animated: true, completion: nil)
        }
    
        @IBAction func actionSheetExample2Tapped(sender: UIButton) {
    
    
            let alert = DYAlertController(style: .ActionSheet, title: "Doing stuff", titleIconImage: nil, message:"Select one or several options", cancelButtonTitle: "Cancel", okButtonTitle: "Do it", multipleSelection: true, customFrameWidth:200.0, backgroundEffect: .blur)
    
    
            alert.addAction(DYAlertAction(title: "Option 1", style:DYAlertAction.ActionStyle.Default, iconImage: UIImage(named: "editIcon"), setSelected:true, handler: { (alertAction) -> Void in
    
                //print("changing state of first option.  selected: \(alertAction.selected)")
            }))
    
            alert.addAction(DYAlertAction(title: "Option 2", style:DYAlertAction.ActionStyle.Default, iconImage: UIImage(named: "locationIcon"), setSelected:false, handler: { (alertAction) -> Void in
    
              //  print("changing state of 2nd option. selected: \(alertAction.selected)")
    
            }))
    
    
            alert.addAction(DYAlertAction(title: "Risky", style:DYAlertAction.ActionStyle.Destructive, iconImage: UIImage(named: "eyeIcon"), setSelected:true, handler: { (alertAction) -> Void in
                
                
               // print("changing state of 3rd option. selected: \(alertAction.selected)")
                
            }))
            
            alert.handleCancelAction = {
                
               // print("cancel tapped")
            }
            
            alert.handleOKAction = {
                
              //  print("OK button tapped")
            }
            
            
            self.presentViewController(alert, animated: true, completion: nil)
            
        }
    

    func textFieldDidBeginEditing(textField: UITextField) {
        print("began editing!")
    }


}

