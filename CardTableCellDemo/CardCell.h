//
//  CardCell.h
//  CardTableCellDemo
//
//  Created by syxc on 2016/10/19.
//  Copyright © 2016年 syxc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardView.h"

NS_ASSUME_NONNULL_BEGIN

@interface CardCell : UITableViewCell

@property (nonatomic, weak) CardView *cardView;

@end

NS_ASSUME_NONNULL_END
