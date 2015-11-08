//
//  BarViewControllerDelegate.h
//  ClubNetworking
//
//  Created by Quoc Anh Nguyen on 11/8/15.
//  Copyright © 2015 gcall. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BaseViewController;
@protocol BarViewControllerDelegate <NSObject>
-(void) centerButtonAction:(BaseViewController* )barViewController;
@end
