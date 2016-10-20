//
//  CellModel.m
//  CardTableCellDemo
//
//  Created by syxc on 2016/10/19.
//  Copyright © 2016年 syxc. All rights reserved.
//

#import "CellModel.h"

@implementation CellModel

+ (instancetype)modelWithName:(NSString *)name {
  return [[self alloc] initWithName:name];
}

- (instancetype)initWithName:(NSString *)name {
  self = [super init];
  if (self) {
    _name = name;
  }
  return self;
}

@end
