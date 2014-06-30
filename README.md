ESSBlockActionSheet & ESSBlockAlertView
===================

Subclasses of UIActionSheet and UIAlertView that execute blocks on button click, instead of delegate callbacks.

`UIActionSheet` invites tightly coupled code. Its delegate method `actionSheet:clickedButtonAtIndex:` forces you to determine which action to perform based on the clicked button's index. If you change the button order, you have to change the delegate method, too.

`ESSBlockActionSheet`'s initialization is much cleaner. You don't even have to implement `UIActionSheetDelegate`. First, create a few `ESSButtonItem`s:

```
ESSButtonItem *cancelButtonItem = [ESSButtonItem itemWithTitle:@"Cancel"];

ESSButtonItem *anotherButtonItem = [ESSButtonItem itemWithTitle:@"Do Something" block:^{
    // ...
}];
```

Then:

```
ESSBlockActionSheet *actionSheet = [[ESSBlockActionSheet alloc] initWithTitle:@"Action!"
                                                             cancelButtonItem:cancelButtonItem
                                                        destructiveButtonItem:nil
                                                             otherButtonItems:@[anotherButtonItem, aThirdButtonItem]];
[actionSheet showInView:self.view];
```

The appropriate block will be called when a button is clicked. The cancel button block is also called when the action sheet is dismissed for another reason, like the user tapping any other view. Use `nil` for any property you don't want to include.

You can also add buttons after initialization:

```
[actionSheet addButtonWithItem:anotherButtonItem];
[actionSheet addCancelButtonWithItem:cancelButtonItem];
[actionSheet addDestructiveButtonWithItem:destructiveButtonItem];
```

`ESSBlockAlertView`s work in much the same way, with `initWithTitle:message:cancelButtonItem:otherButtonItems:`.

If you prefer, both classes have init methods that use `nil`-terminated, comma-separated strings for `otherButtonItems` instead of `NSArray`s.

Requirements
---
- ARC

Note: Blocks and ARC were both introduced in iOS 4, but I haven't tested this on any SDK version older than 7.0. Create an [issue](https://github.com/erikstrottmann/ESSBlockActionSheet/issues) to let me know if you have success or problems with earlier SDK versions.

License
---
Copyright (c) 2014 Erik Strottmann

Licensed under the MIT License. See [the license file](LICENSE) for more details.
