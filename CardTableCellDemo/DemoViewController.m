//
//  DemoViewController.m
//  CardTableCellDemo
//
//  Created by syxc on 2016/10/19.
//  Copyright © 2016年 syxc. All rights reserved.
//

#import "DemoViewController.h"

@interface DemoViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *titleArray;

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
  return [_titleArray count] * 2 - 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *const CellSeparator = @"CellSeparator";
  // even rows will be invisible
  if (indexPath.row % 2 == 1) {
    UITableViewCell *tempCell = [tableView dequeueReusableCellWithIdentifier:CellSeparator];
    if (!tempCell) {
      tempCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellSeparator];
      tempCell.selectionStyle = UITableViewCellSeparatorStyleNone;
      [tempCell.contentView setAlpha:0];
      [tempCell.contentView setUserInteractionEnabled:NO]; // prevent selection and other stuff
      tempCell.backgroundColor = [UIColor clearColor];
    }
    return tempCell;
  }
  
  static NSString *const CellIdentifier = @"CardCell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.backgroundColor = [UIColor whiteColor];
  }
  
  cell.textLabel.text = _titleArray[indexPath.row/2];
  
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.row % 2 == 1) {
    return 20;
  }
  return 160;
}

@end
