//
//  CommentViewController.h
//  ZHBCommentModal
//
//  Created by icode on 15/5/29.
//  Copyright (c) 2015年 sinitek. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZHBCommentModal;


@interface CommentViewController : UIViewController

typedef void(^CommentButtonOnClick)(UIButton *commitButton);

@property (nonatomic,strong) UIButton *commitButton;

@property (nonatomic,copy) CommentButtonOnClick commentBlock;

@property (nonatomic,copy) NSString *contentString;

@property (nonatomic,weak) ZHBCommentModal *modal;

@end