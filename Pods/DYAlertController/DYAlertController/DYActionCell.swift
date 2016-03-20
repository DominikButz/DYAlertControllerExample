//
//  DYActionCellTableViewCell.swift
//  SimpleAlertTesting
//
//  Created by Dominik Butz on 24/02/16.
//  Copyright © 2016 Duoyun. All rights reserved.
//

import UIKit

public class DYActionCell: UITableViewCell {

   @IBOutlet weak var actionTitleLabel: UILabel!
    
    @IBOutlet weak var actionImageView: UIImageView?
    
    var settings:DYAlertSettings.ActionCellSettings!
    
 //   var actionItemSelected = false

    var hasAccessoryView = false
    
    var style = DYAlertAction.ActionStyle.Default
    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override public func setSelected(selected: Bool, animated: Bool) {

        if self.selected == selected {
            print("already selected or deselcted, returning")
            return
        }
        
        super.setSelected(selected, animated: animated)

        print("set selected called")

        if hasAccessoryView {
            // has ok button!

            if selected {
                self.accessoryType = .Checkmark
                self.tintColor = self.getColour(self.style, selected:  true)
      
            } else {
                self.accessoryType = .None
                self.tintColor = self.getColour(self.style, selected: false)
//                self.actionTitleLabel.textColor = colour
//                self.actionImageView?.tintColor = colour
            }

            self.actionTitleLabel.textColor = self.tintColor
           //self.toggleSelectedState(selected)

        } 


    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    
    func configureCell(actionItem:DYAlertAction, hasAccessoryView:Bool, settings:DYAlertSettings.ActionCellSettings) {
        
        print("configure cell called")
        
       self.actionTitleLabel.text = actionItem.title
       self.actionTitleLabel.font = settings.actionCellFont
        
        let iconImage = actionItem.iconImage
        self.actionImageView!.image = iconImage?.imageWithRenderingMode(.AlwaysTemplate)
       self.actionImageView!.contentMode = .ScaleAspectFit
        
        self.userInteractionEnabled = (actionItem.style != .Disabled)
        self.hasAccessoryView = hasAccessoryView
        self.style = actionItem.style
        
        self.settings = settings

        if hasAccessoryView {
            //has ok button!
             self.selectionStyle = .None

            self.tintColor = self.getColour(self.style, selected:  actionItem.selected)

            
        } else {
            // no ok button, no checkmarks
            self.selectionStyle = .Gray
            self.tintColor = self.getColour(self.style, selected: true)
           self.centerViewElements()

        }
        
             self.actionTitleLabel.textColor = self.tintColor
  
    
    }
    

//    }
    
    private func getColour(style:DYAlertAction.ActionStyle, selected:Bool)->UIColor {
        
        switch style {
        case .Disabled:
            return settings.disabledTintColor
        case .Default:
            if selected {
                return settings.defaultTintColor
            } else {
                return settings.deselectedTintColor
            }
        case .Destructive:
            if selected {
                return settings.destructiveTintColor
            } else {
                return settings.deselectedTintColor
            }
            
        }
    }
    

    
//
    private func centerViewElements() {
        
    
        if let _ = actionImageView?.image {

            self.contentView.constraints[2].constant = 5.0
            
            let labelWidth = self.actionTitleLabel.frame.size.width

          self.contentView.constraints[0].constant =  self.contentView.frame.size.width / 2 - labelWidth / 2 - self.contentView.constraints[2].constant - actionImageView!.frame.size.width
            

        }   else {
            actionImageView?.removeFromSuperview()
        }
        
  
        
        let centerLabelConstraint = NSLayoutConstraint(item: self.contentView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: actionTitleLabel, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
  
        self.contentView.addConstraint(centerLabelConstraint)


    }

}
