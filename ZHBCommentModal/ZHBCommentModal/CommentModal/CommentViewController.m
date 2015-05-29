//
//  CommentViewController.m
//  ZHBCommentModal
//
//  Created by icode on 15/5/29.
//  Copyright (c) 2015年 sinitek. All rights reserved.
//

#import "CommentViewController.h"
#import "ZHBCommentModal.h"
#import "CommentViewFrameConstants.h"

@interface CommentViewController ()

@property (nonatomic,strong) UIButton *commentButton;

@property (nonatomic,strong) UIView *inputView;

@property (nonatomic,strong) UITextView *textView;

@property (nonatomic,strong) UITapGestureRecognizer *tapGestureRecognizer;

@end

@implementation CommentViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.55];
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
    [self.view addSubview:self.inputView];
    [self.inputView addSubview:self.textView];
    [self.inputView addSubview:self.commentButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - event response
-(void)handleTap:(UITapGestureRecognizer *)tapGestureRecognizer{
    
}

#pragma mark - getter & setter
-(UIView *)inputView{
    if (!_inputView) {
        _inputView = [[UIView alloc] initWithFrame:CGRectMake(0, ControllerViewHeight - InputView_Orign_Height , InputView_Width, InputView_Orign_Height)];
        _inputView.backgroundColor = [UIColor lightGrayColor];
    }
    return _inputView;
}

-(UIButton *)commentButton{
    if (!_commentButton) {
        _commentButton = [[UIButton alloc] initWithFrame:CGRectMake(InputView_Width - CommentButtonWidth - InputView_Padding, InputView_Padding, CommentButtonWidth, CommentButtonHeight)];
    }
    return _commentButton;
}

-(UITextView *)textView{
    if (!_textView) {
        _textView = [[UITextView alloc] initWithFrame:CGRectMake(InputView_Padding, InputView_Padding, TextView_Width, TextView_Origin_Height)];
        _textView.layer.borderWidth = 0.5f;
        _textView.layer.borderColor = [UIColor blackColor].CGColor;
    }
    return _textView;
}

-(UITapGestureRecognizer *)tapGestureRecognizer{
    if(!_tapGestureRecognizer){
        _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    }
    return _tapGestureRecognizer;
}

@end
