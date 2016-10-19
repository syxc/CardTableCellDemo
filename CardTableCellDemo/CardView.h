//
//  CardView.h
//  CardTableCellDemo
//
//  Created by syxc on 2016/10/19.
//  Copyright © 2016年 syxc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CellModel;

NS_ASSUME_NONNULL_BEGIN

@interface CardView : UIView

@property (nonatomic, strong) CellModel *cellModel;

@end

NS_ASSUME_NONNULL_END
