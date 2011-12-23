//
//  UIViewController+PushTransition.h
//  Created by http://github.com/iosdeveloper
//

#import <UIKit/UIKit.h>

@interface UIViewController (PushTransition)

- (void)pushViewController:(UIViewController *)viewControllerToPush;
- (void)dismissPushedViewController;

@end
