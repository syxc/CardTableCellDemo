//
//  CellModel.h
//  CardTableCellDemo
//
//  Created by syxc on 2016/10/19.
//  Copyright © 2016年 syxc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellModel : NSObject

@property (copy, nonatomic) NSString *name;

+ (instancetype)modelWithName:(NSString *)name;

@end

NS_ASSUME_NONNULL_END
