//
//  CardCell.m
//  CardTableCellDemo
//
//  Created by syxc on 2016/10/19.
//  Copyright © 2016年 syxc. All rights reserved.
//

#import "CardCell.h"
#import "CardView.h"

@interface CardCell ()

@end

@implementation CardCell

- (void)awakeFromNib {
  [super awakeFromNib];
  // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
  
  // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  if (self) {
    CardView *cardView = [[CardView alloc] init];
    cardView.backgroundColor = [UIColor whiteColor];
    
    _cardView = cardView;
    
    [self.contentView addSubview:cardView];
  }
  return self;
}

- (void)layoutSubviews {
  CGRect rect = self.contentView.bounds;
  _cardView.frame = CGRectMake(16, 0, rect.size.width - 32, rect.size.height);
}

@end
