//
//  ZHBCommentModal.h
//  ZHBCommentModal
//
//  Created by icode on 15/5/29.
//  Copyright (c) 2015年 sinitek. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^CommentCommitBlock)(NSString *content,UIView *view);

@interface ZHBCommentModal : NSObject

@property (nonatomic,assign) BOOL tapOutsideToDismiss;

@property (nonatomic,copy) CommentCommitBlock commentCommitBlock;

+ (instancetype)sharedInstance;

- (void)showWithCommentCommitBlock:(CommentCommitBlock)commentCommitBlock;

- (void)hideAnimated:(BOOL)animated;

- (void)hideAnimated:(BOOL)animated withCompletionBlock:(void(^)())completion;

@end




