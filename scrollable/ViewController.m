//
//  ViewController.m
//  scrollable
//
//  Created by Masakazu Aoki on 2014/08/23.
//  Copyright (c) 2014年 externalight. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //キーボード表示・非表示の通知の開始
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    //キーボード表示・非表示の通知を終了
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UITextField Show/Hide Notification
- (void)keyboardWillShow:(NSNotification *)ns {
    
    // キーボードのCGRect
    CGRect keyboardRect = [[[ns userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardRect.size.height, 0.0);
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect aRect = self.view.frame;
    aRect.size.height -= keyboardRect.size.height;
/*    if (_activeTextField != nil) {
        CGPoint scrollPoint = CGPointMake(0.0, _activeTextField.frame.origin.y - 30);
        [self.scrollView setContentOffset:scrollPoint animated:YES];
    }
 */
}

- (void)keyboardWillHide:(NSNotification *)ns {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    self.scrollView.contentInset = contentInsets;
    self.scrollView.scrollIndicatorInsets = contentInsets;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
