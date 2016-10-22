//
//  DemoViewController.m
//  CardTableCellDemo
//
//  Created by syxc on 2016/10/19.
//  Copyright © 2016年 syxc. All rights reserved.
//

#import "DemoViewController.h"
#import "CardCell.h"
#import "CellModel.h"

@interface DemoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *titleArray;

@end

@implementation DemoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title = @"CardTableCellDemo";
  self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
  
  _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
  _tableView.dataSource = self;
  _tableView.delegate = self;
  _tableView.backgroundColor = [UIColor clearColor];
  _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
  _tableView.contentInset = UIEdgeInsetsMake(20, 0, 20, 0); // top, bootom margin: 20
  
  [self.view addSubview:_tableView];
  
  NSArray *titles = @[@"Apple", @"Google", @"Facebook", @"Twitter"];
  
  _titleArray = [[NSMutableArray alloc] initWithArray:titles];
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)dealloc {
  if (_tableView) {
    _tableView.dataSource = nil;
    _tableView.delegate = nil;
    _tableView = nil;
  }
  
  _titleArray = nil;
}

#pragma mark - UITableViewDataSource & UITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if ([_titleArray count] > 0) {
    return [_titleArray count] * 2 - 1;
  }
  return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *const CellSeparator = @"CellSeparator";
  // even rows will be invisible
  if (indexPath.row % 2 == 1) {
    UITableViewCell *tempCell = [tableView dequeueReusableCellWithIdentifier:CellSeparator];
    if (!tempCell) {
      tempCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellSeparator];
      tempCell.selectionStyle = UITableViewCellSeparatorStyleNone;
      tempCell.backgroundColor = [UIColor clearColor];
      [tempCell setAlpha:0];
      [tempCell setUserInteractionEnabled:NO]; // prevent selection and other stuff
    }
    return tempCell;
  }
  
  static NSString *const CellIdentifier = @"CardCell";
  CardCell *cardCell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (!cardCell) {
    cardCell = [[CardCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cardCell.selectionStyle = UITableViewCellSeparatorStyleNone;
    cardCell.backgroundColor = [UIColor clearColor];
  }
  
  if (indexPath.row / 2 < [_titleArray count]) {
    CellModel *model = [CellModel modelWithName:_titleArray[indexPath.row / 2]];
    [cardCell.cardView setCellModel:model];
  }
  
  return cardCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row % 2 == 1) {
    return 20;
  }
  return 160;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
  if ([cell isKindOfClass:[CardCell class]]) {
    CardCell *cardCell = (CardCell *)cell;
    NSLog(@"Cell title: %@ Cell row: %ld", cardCell.cardView.cellModel.name, indexPath.row);
  }
}

@end
