//
//  CardView.m
//  CardTableCellDemo
//
//  Created by syxc on 2016/10/19.
//  Copyright © 2016年 syxc. All rights reserved.
//

#import "CardView.h"
#import "CellModel.h"

@interface CardView ()

@property (nonatomic, assign) CGFloat cornerRadius;
@property (nonatomic, assign) int shadowOffsetWidth;
@property (nonatomic, assign) int shadowOffsetHeight;
@property (nonatomic, strong) UIColor *shadowColor;
@property (nonatomic, assign) CGFloat shadowOpacity;

@property (nonatomic, weak) UILabel *nameLabel;

@end

@implementation CardView

- (instancetype)init {
  self = [super init];
  if (self) {
    _cornerRadius = 2;
    _shadowOffsetWidth = 0;
    _shadowOffsetHeight = 2;
    _shadowColor = [UIColor darkGrayColor];
    _shadowOpacity = 0.5;
  }
  return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    UILabel *nameLabel = [[UILabel alloc] init];
    self.nameLabel = nameLabel;
    [self addSubview:nameLabel];
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  self.layer.cornerRadius = _cornerRadius;
  self.layer.masksToBounds = NO;
  self.layer.shadowColor = _shadowColor.CGColor;
  self.layer.shadowOffset = CGSizeMake(_shadowOffsetWidth, _shadowOffsetHeight);
  self.layer.shadowOpacity = _shadowOpacity;
  UIBezierPath *shadowPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:_cornerRadius];
  self.layer.shadowPath = shadowPath.CGPath;
  
  self.nameLabel.frame = self.frame;
}

- (void)setCellModel:(CellModel *)cellModel {
  _cellModel = cellModel;
  self.nameLabel.text = cellModel.name;
}
@end
