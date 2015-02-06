ESSBlockActionSheet & ESSBlockAlertView
===

`ESSBlockActionSheet` and `ESSBlockAlertView` bring the simplicity of [`UIAlertController`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIAlertController_class/) to iOS 7 and earlier. They're subclasses of [`UIActionSheet`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIActionSheet_Class/index.html) and [`UIAlertView`](https://developer.apple.com/library/ios/documentation/UIKit/Reference/UIAlertView_Class/index.html), respectively, that replace their superclasses' messy delegate methods with simple, loosely coupled [blocks](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/WorkingwithBlocks/WorkingwithBlocks.html).

Using ESSBlockActionSheet
---

It's simple to create an action sheet and add some actions:

```
ESSBlockActionSheet *actionSheet = [ESSBlockActionSheet actionSheetWithTitle:@"Action!"];

ESSAlertAction *anAction = [ESSAlertAction actionWithTitle:@"~Dance~" block:{
    // ...
}
ESSAlertAction *cancel = [ESSAlertAction actionWithTitle:@"Take a nap" block:nil];

[actionSheet addAction:anAction];
[actionSheet addCancelAction:cancel];
```

You'll present the action sheet differently depending on the device you're running on:

```
BOOL onPhone = [[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone;
if (onPhone) {  // on iPhone
    [actionSheet showInView:self.view];
} else { // on iPad
    [actionSheet showFromRect:self.view.bounds inView:self.view animated:YES];
}
```

Action sheets can have many actions, but only one cancel action and one destructive action.

```
[actionSheet addDestructiveAction:destroy];

[actionSheet addAction:anotherAction];
[actionSheet addAction:oneMoreAction];
```

Using ESSBlockAlertView
---

Alert views are just as simple:

```
ESSBlockAlertView *alertView = [ESSBlockAlertView actionSheetWithTitle:@"Alert!" message:@"You need to do something!"];

ESSAlertAction *anAction = [ESSAlertAction actionWithTitle:@"I'll sing!" block:{
    // ...
}
ESSAlertAction *cancel = [ESSAlertAction actionWithTitle:@"Nah" block:nil];

[alertView addAction:anAction];
[alertView addCancelAction:cancel];
```

Alert views are presented the same way whether you're on an iPhone or an iPad:

```
[alertView show];
```

Alert views can have many actions, but only one cancel action (and no destructive actions).

They can also use all of the text field styles defined in `UIAlertView`:

```
alertView.alertViewStyle = UIAlertViewStyleDefault; // no text fields
alertView.alertViewStyle = UIAlertViewStylePlainTextInput; // plain text field
alertView.alertViewStyle = UIAlertViewStyleSecureTextInput; // password field
alertView.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput; // username and password fields
```

Requirements
---
- Support for [blocks](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/WorkingwithBlocks/WorkingwithBlocks.html) (i.e. iOS 4.0 or greater)
- [Automatic Reference Counting (ARC)](https://developer.apple.com/library/ios/releasenotes/ObjectiveC/RN-TransitioningToARC/Introduction/Introduction.html) enabled

Note: Blocks and ARC were both introduced in iOS 4.0, but I haven't tested this on any SDK version older than 7.0. Create an [issue](https://github.com/erikstrottmann/ESSBlockActionSheet/issues) to let me know if you have success or problems with earlier SDK versions.

License
---
Copyright (c) 2014-2015 Erik Strottmann

Licensed under the MIT License. See the [license file](LICENSE) for more details.
