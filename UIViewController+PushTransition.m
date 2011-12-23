//
//  UIViewController+PushTransition.m
//  Created by http://github.com/iosdeveloper
//

#import "UIViewController+PushTransition.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIViewController (PushTransition)

- (void)pushViewController:(UIViewController *)viewControllerToPush {
    [viewControllerToPush setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.75];
    [transition setType:kCATransitionPush];
    [transition setSubtype:kCATransitionFromRight];
    [self.view.superview.layer addAnimation:transition forKey:nil];
    
    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]) {
        [self presentViewController:viewControllerToPush animated:YES completion:NULL];
    } else {
        [self presentModalViewController:viewControllerToPush animated:YES];
    }
}

- (void)dismissPushedViewController {
    CATransition *transition = [CATransition animation];
    [transition setDuration:0.75];
    [transition setType:kCATransitionPush];
    [transition setSubtype:kCATransitionFromLeft];
    
    if ([self respondsToSelector:@selector(presentedViewController)]) {
        [self.presentedViewController.view.superview.layer addAnimation:transition forKey:nil];
    } else {
        [self.modalViewController.view.superview.layer addAnimation:transition forKey:nil];
    }
    
    if ([self respondsToSelector:@selector(dismissViewControllerAnimated:completion:)]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    } else {
        [self dismissModalViewControllerAnimated:YES];
    }
}

@end
