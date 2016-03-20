//
//  DYAlert.swift
//  SimpleAlertTesting
//
//  Created by Dominik Butz on 23/02/16.
//  Copyright © 2016 Duoyun. All rights reserved.
//

import Foundation
import UIKit

public struct DYAlertSettings {
    

    public struct TitleViewSettings {
        public var titleTextColor = UIColor.darkGrayColor()
        public var messageTextColor = UIColor.grayColor()
        public var titleTextFont =  UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
        public var messageTextFont = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        public var backgroundColor = UIColor.clearColor()
    }
    
    public struct ActionCellSettings {
        public var deselectedTintColor = UIColor.grayColor()
        public var defaultTintColor = UIColor(red: 0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1)
        public var destructiveTintColor = UIColor.redColor()
        public var disabledTintColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.5)
        public var actionCellFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    }
    
   public struct TextFieldSettings {
        public var backgroundColor = UIColor.lightGrayColor().colorWithAlphaComponent(0.7)
        public var textColor = UIColor.whiteColor()
        public var textFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        
    }
    
    public struct ButtonSettings {
        public var cancelButtonTintColor = UIColor(red: 0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1)
        public var okButtonTintColor = UIColor(red: 0/255.0, green: 122.0/255.0, blue: 255.0/255.0, alpha: 1)
        public var okButtonBackgroundColor = UIColor.whiteColor()
        public var cancelButtonBackgroundColor = UIColor.whiteColor()
        public var buttonFont = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        public var cornerRadius:CGFloat = 5.0
    }
    
    public struct ContentViewSettings {
        
        public var cornerRadius:CGFloat = 8.0
        public var mainViewBackgroundColor = UIColor.whiteColor()
    }
    
    
    public struct EffectViewSettings {
        
        public var blurViewStyle: UIBlurEffectStyle = .Dark
        public var dimViewColor = UIColor.blackColor().colorWithAlphaComponent(0.6)
    }

    
    
}