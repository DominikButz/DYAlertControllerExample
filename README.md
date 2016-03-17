# DYAlertController

DYAlertController can be used as a replacement for Apple’s UIAlertController. DYAlertController also features two styles, alert and actionSheet. Tapping an action and tapping the ok or cancel button will trigger actions you define in the action item’s handler or in the cancel and ok button handlers, similar to UIAlertController.

## Installation


Install DYAlertController through Cocoapods. Enter the following information into your Podfile:

```Ruby
platform :ios, '8.0'
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/DominikButz/DYAlertControllerSpecs.git'

use_frameworks!

target '[Your app project title]' do
pod 'DYAlertController', '~> 0.2.5'
end

```
Make sure to import DYAlertController into your View Controller subclass:

```Swift
	import DYAlertController
```
**Important**: The Xcode compiler might show an error after you open your project .xcworkspace file including DYAlertController for the first time (something like "Could not find module DYAlertController"). I have had this issue with a lot of other Cocoapods which I tried to install before. Simply run your code and the error should disappear. 

Alternatively, you can pull this example project and copy the DYAlertController folder (in the pods folder) from the example project into your project. 


##Features

As alternative to UIAlertController, DYAlertController has the following additional features:

* Add an icon image to the title view right above the title
* Add an icon image to an action
* If you set an ok button title (which is optional), clicking on an action will not dismiss the alert or action sheet but will toggle a checkmark instead. You can also set the controller to multiple selection. If you don’t define an ok button title, the alert or action sheet will be dismissed when tapping an action
* Choose from two background effect view styles, blur and dim
* Set a custom width for the alert or action sheet (its height will be set automatically depending on the content view’s subviews)
* Customise colours, fonts, corner radius etc.



## Usage

The usage is very similar to UIAlertController. See the following example.


###Code example: Creating an alert

```Swift
let titleImage = UIImage(named: "shareIcon")
let alert = DYAlertController(style: .Alert, title: "Doing stuff", titleIconImage: titleImage, message:"Select one option", cancelButtonTitle: "Cancel", okButtonTitle: nil, multipleSelection: false, customFrameWidth:200.0, backgroundEffect: .blur)

alert.addAction(DYAlertAction(title: "Do stuff 1", style:.Default, iconImage: UIImage(named: "editIcon"), setSelected:false, handler: { (alertAction) -> Void in

print("executing first action! selected: \(alertAction.selected)")
}))

alert.addAction(DYAlertAction(title: "Do stuff 2", style:.Default, iconImage: UIImage(named: "locationIcon"), setSelected:false, handler: { (alertAction) -> Void in

print("executing 2nd action! selected: \(alertAction.selected)")

}))


alert.addAction(DYAlertAction(title: "Beware!", style:.Destructive, iconImage: UIImage(named: "eyeIcon"), setSelected:true, handler: { (alertAction) -> Void in


print("executing 3rd action! selected: \(alertAction.selected)")

}))

alert.handleCancelAction = {

print("cancel tapped")
}

alert.handleOKAction = {

print("OK button tapped")
}


self.presentViewController(alert, animated: true, completion: nil)

```

![Alert example 1](https://github.com/DominikButz/DYAlertControllerExample/blob/master/gitResources/AlertExample1.gif "Alert example 1")

### Adding a text field
```Swift
alert.addTextField(“Title")   // set parameter nil if the text field should be empty

// simply access the textField instance variable of the alert you created. e.g.:
alert.textField!.delegate = self
```


![Alert example 2](https://github.com/DominikButz/DYAlertControllerExample/blob/master/gitResources/AlertExample2.gif "Alert example 2")

Currently, only **one** text field is supported. Make sure to only add a text field to an alert - just like UIAlertController, **your app will crash at runtime if you try to add a text field to an action sheet**. 

### Action sheet examples

Action sheet with simple selection:

![Action Sheet example 1](https://github.com/DominikButz/DYAlertControllerExample/blob/master/gitResources/ActionSheetExample1.gif "ActionSheet example 1")


Action sheet with multiple selection:

![Action Sheet example 2](https://github.com/DominikButz/DYAlertControllerExample/blob/master/gitResources/ActionSheetExample2.gif "ActionSheet example 2")

### Customising
If you intend to create several alerts or action sheets with the same fonts and colours in your app you can simply change the default settings in the DYAlertSettings struct. Alternatively, you can change single properties in code by changing the properties in the struct objects. For example:

```Swift

alert.contentViewSettings.cornerRadius = 2.0

alert.titleViewSettings.titleTextColor = UIColor.blackColor()

```

These changes only overwrite the settings properties of your current DYAlertViewController instance. Check out the DYAlertSettings.swift file. 

## License

The MIT License (MIT)

Copyright (c) 2016 Dominik Butz

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

