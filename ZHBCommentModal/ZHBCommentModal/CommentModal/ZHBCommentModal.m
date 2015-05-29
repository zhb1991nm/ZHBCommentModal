//
//  ZHBCommentModal.m
//  ZHBCommentModal
//
//  Created by icode on 15/5/29.
//  Copyright (c) 2015年 sinitek. All rights reserved.
//

#import "ZHBCommentModal.h"
#import "CommentViewController.h"

@interface ZHBCommentModal()

@property (nonatomic,strong) UIWindow *window;

@property (nonatomic,strong) CommentViewController *commentViewController;

@end

@implementation ZHBCommentModal

+ (instancetype)sharedInstance{
    static id sharedInstance;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[[self class] alloc] init];
    });
    return sharedInstance;
}

- (void)showWithCommentCommitBlock:(CommentCommitBlock)commentCommitBlock{
    self.commentCommitBlock = commentCommitBlock;
    self.window.rootViewController = self.commentViewController;
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.window makeKeyAndVisible];
    });
}

- (void)hideAnimated:(BOOL)animated{
    [self hideAnimated:animated withCompletionBlock:nil];
}

- (void)hideAnimated:(BOOL)animated withCompletionBlock:(void(^)())completion{
    completion();
    if (self.commentViewController) {
        [self.commentViewController.view removeFromSuperview];
        [self.commentViewController removeFromParentViewController];
        self.commentViewController = nil;
    }
    [self.window removeFromSuperview];
    self.window = nil;
}

#pragma mark - getter & setter
-(UIWindow *)window{
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        self.window.opaque = NO;
    }
    return _window;
}

-(CommentViewController *)commentViewController{
    if (!_commentViewController) {
        _commentViewController = [[CommentViewController alloc] init];
        _commentViewController.modal = self;
        __weak typeof(self) weakSelf = self;
        _commentViewController.commentBlock = ^(UIButton *button){
            if (weakSelf.commentCommitBlock) {
                weakSelf.commentCommitBlock(weakSelf.commentViewController.contentString,weakSelf.commentViewController.view);
            }
        };
    }
    return _commentViewController;
}

@end