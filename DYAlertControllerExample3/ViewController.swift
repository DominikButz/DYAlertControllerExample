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
            let alert = DYAlertController(style: .Alert, title: "Doing stuff", titleIconImage: titleImage, message:"Select one option", cancelButtonTitle: "Cancel", multipleSelection: false, customFrameWidth:200, backgroundEffect: DYAlertController.EffectViewMode.blur)

    
            alert.addAction(DYAlertAction(title: "Do stuff 1", style:.Default, iconImage: nil, setSelected:false, handler: { (alertAction) -> Void in
    
               print("executing first action! selected: \(alertAction.selected)")
                
            }))
    
            alert.addAction(DYAlertAction(title: "Do stuff 2", style:.Default, iconImage: nil, setSelected:false, handler: { (alertAction) -> Void in
    
               print("executing 2nd action! selected: \(alertAction.selected)")
    
            }))
    
    
            alert.addAction(DYAlertAction(title: "Beware!", style:.Destructive, iconImage: nil, setSelected:true, handler: { (alertAction) -> Void in
    
    
               print("executing 3rd action! selected: \(alertAction.selected)")
    
            }))

            alert.handleCancelAction = {
    
               print("cancel tapped")
            }
    

            self.presentViewController(alert, animated: true, completion: nil)
    
        }
    
    
    
        @IBAction func alertExample2Tapped(sender: UIButton) {
    
            let titleImage = UIImage(named: "shareIcon")
            let alert = DYAlertController(style: .Alert, title: "Edit Title", titleIconImage: titleImage, message: "Type in a new title", cancelButtonTitle: "Cancel", multipleSelection: false, customFrameWidth:180.0, backgroundEffect: DYAlertController.EffectViewMode.dim)
    
            alert.addTextField(nil)
            alert.textField!.delegate = self
    
    
            alert.handleCancelAction = {
    
                print("cancel tapped")
            }
    
            alert.addOKButtonAction("OK", setDisabled: false) { 
                 print("ok button with title \(alert.okButton?.titleLabel?.text) tapped")
            }
            
            
    
            self.presentViewController(alert, animated: true, completion: nil)
    
        }
    
    
        @IBAction func actionSheetExample1Tapped(sender: UIButton) {
    
            let titleImage = UIImage(named: "shareIcon")
            let actionSheet = DYAlertController(style: .ActionSheet, title: "Doing stuff", titleIconImage: titleImage, message:"Select one option", cancelButtonTitle: "Cancel", multipleSelection: false, customFrameWidth:nil, backgroundEffect:.dim)
    
            enum SelectedOption: String {
                case firstOption = "First Option"
                case secondOption = "Second Option"
                case thirdOption = "Third Option"
                case none  = "None"
            }
            
            var selected:SelectedOption = .firstOption
            
            actionSheet.addAction(DYAlertAction(title: "Option 1", style:.Default, iconImage: UIImage(named: "eyeIcon"), setSelected:true, handler: { (action) -> Void in
    
                if action.selected {
                    selected = .firstOption
                    actionSheet.okButton!.setDefaultStyle("OK", titleColor: actionSheet.settings.okButtonTintColorDefault)

                } else {
                    // deselected
                    
                    if actionSheet.allActionsDeselected() {
                        selected = .none
                        actionSheet.okButton!.setDisabledStyle("Disabled", titleColor: actionSheet.settings.okButtonTintColorDisabled)
                    }
                    
                }
                
                print("changing stat of first option.  selected: \(action.selected)")
            }))
    
            actionSheet.addAction(DYAlertAction(title: "Option 2", style:.Default, iconImage: UIImage(named: "locationIcon"), setSelected:false, handler: { (action) -> Void in
    
                if action.selected {
                    selected = .secondOption
                    actionSheet.okButton!.setDefaultStyle("OK", titleColor: actionSheet.settings.okButtonTintColorDefault)
                } else {
                    // deselected
                    if actionSheet.allActionsDeselected() {
                        selected = .none
                        actionSheet.okButton!.setDisabledStyle("Disabled", titleColor: actionSheet.settings.okButtonTintColorDisabled)
                    }
                    
                }
                
               print("changing state of 2nd option. selected: \(action.selected)")
    
            }))
    
    
            actionSheet.addAction(DYAlertAction(title: "Option 3 - risky", style: .Destructive, iconImage: UIImage(named: "eyeIcon"), setSelected:false, handler: { (action) -> Void in
                
                if action.selected {
                    selected = .thirdOption
                    actionSheet.okButton!.setDestructiveStyle("Beware!", titleColor: actionSheet.settings.okButtonTintColorDestructive)
                } else {
                    // deselected
                    if actionSheet.allActionsDeselected() {
                        selected = .none
                        actionSheet.okButton!.setDisabledStyle("Disabled", titleColor: actionSheet.settings.okButtonTintColorDisabled)
                    }
                    
                }
    
                        print("changing state of 3rd option. selected: \(action.selected)")
    
            }))
    

            actionSheet.addOKButtonAction("OK", setDisabled: false) { 
                 print("ok button tapped -  option selected: \(selected.rawValue)")
            }
            
            actionSheet.handleCancelAction = {
                
                print("cancel tapped")
            }
    
    
            self.presentViewController(actionSheet, animated: true, completion: nil)
        }
    
    
    
        @IBAction func actionSheetExample2Tapped(sender: UIButton) {
    
    
            let actionSheet = DYAlertController(style: .ActionSheet, title: "Doing stuff", titleIconImage: nil, message:"Select one or several options", cancelButtonTitle: "Cancel", multipleSelection: true, customFrameWidth:200.0, backgroundEffect: .blur)
    
    
            actionSheet.addAction(DYAlertAction(title: "Option 1", style:.Default, iconImage: UIImage(named: "editIcon"), setSelected:false, handler: { (action) -> Void in
                
                if action.selected {
                    actionSheet.okButton!.setDefaultStyle("OK", titleColor: actionSheet.settings.okButtonTintColorDefault)

                } else {
                
                    if actionSheet.allActionsDeselected() {
          
                        actionSheet.okButton!.setDisabledStyle("Disabled", titleColor: actionSheet.settings.okButtonTintColorDisabled)
                    }
                }


            }))
    
            actionSheet.addAction(DYAlertAction(title: "Option 2", style:.Default, iconImage: UIImage(named: "locationIcon"), setSelected:false, handler: { (action) -> Void in
    
                print("changing state of 2nd option. selected: \(action.selected), activating OK button")
                if action.selected {
                  actionSheet.okButton!.setDefaultStyle("OK", titleColor: actionSheet.settings.okButtonTintColorDefault)
             
                } else {
                   if actionSheet.allActionsDeselected() {
                        actionSheet.okButton!.setDisabledStyle("Disabled", titleColor: actionSheet.settings.okButtonTintColorDisabled)
                    }
                }
                
            }))
    
    
            actionSheet.addAction(DYAlertAction(title: "Risky", style:.Destructive, iconImage: UIImage(named: "eyeIcon"), setSelected:false, handler: { (action) -> Void in
                
                if action.selected {
                    actionSheet.okButton!.setDestructiveStyle("Beware!", titleColor:actionSheet.settings.okButtonTintColorDestructive)
                    
                } else {
                     if actionSheet.allActionsDeselected() {
                        actionSheet.okButton!.setDisabledStyle("Disabled", titleColor: actionSheet.settings.okButtonTintColorDisabled)
                    }
                }
             
                
            }))
            
            actionSheet.handleCancelAction = {
                
               print("cancel tapped")
            }
            
            actionSheet.addOKButtonAction("OK", setDisabled: true) {
                      // can't be tapped when sheet starts up because of state 'disabled' but can be  changed through user selection - see actions above
            }

            
            
            self.presentViewController(actionSheet, animated: true, completion: nil)
            
        }
    

    func textFieldDidBeginEditing(textField: UITextField) {
        print("began editing!")
    }


}

