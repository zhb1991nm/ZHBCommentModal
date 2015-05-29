//
//  CommentViewFrameConstants.h
//  ZHBCommentModal
//
//  Created by icode on 15/5/29.
//  Copyright (c) 2015年 sinitek. All rights reserved.
//

#ifndef ZHBCommentModal_CommentViewFrameConstants_h
#define ZHBCommentModal_CommentViewFrameConstants_h

#define ControllerViewWidth [UIScreen mainScreen].bounds.size.width
#define ControllerViewHeight [UIScreen mainScreen].bounds.size.height
#define InputView_Padding 7.0f
#define InputView_Width ControllerViewWidth
#define CommentButtonWidth 44.0f
#define CommentButtonHeight 33.0f
#define TextView_Origin_Height 33.0f
#define TextView_Width (InputView_Width - 3 * InputView_Padding - CommentButtonWidth)
#define InputView_Height(TextView_Height) (TextView_Height + 2 * InputView_Padding)
#define InputView_Orign_Height InputView_Height(TextView_Origin_Height)

#endif
