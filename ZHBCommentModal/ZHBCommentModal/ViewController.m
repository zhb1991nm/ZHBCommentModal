//
//  ViewController.m
//  ZHBCommentModal
//
//  Created by icode on 15/5/29.
//  Copyright (c) 2015年 sinitek. All rights reserved.
//

#import "ViewController.h"
#import "ZHBCommentModal.h"
#import "Toast+UIView.h"

@interface ViewController ()

- (IBAction)commentButtonOnClick:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)commentButtonOnClick:(UIButton *)sender {
    [[ZHBCommentModal sharedInstance] showWithCommentCommitBlock:^(NSString *content,UIView *view) {
        [view makeToastActivity];
        __weak typeof(view) weakView = view;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakView hideToastActivity];
        });
    }];
}
@end
