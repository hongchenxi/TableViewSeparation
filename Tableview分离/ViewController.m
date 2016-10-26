//
//  ViewController.m
//  Tableview分离
//
//  Created by 晨希 on 16/10/26.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "ViewController.h"
#import "CXTableDataDelegate.h"
#import "UITableViewCell+Category.h"
#import "Student.h"
#import "StudentCell.h"

@interface ViewController ()
@property (nonatomic, strong) CXTableDataDelegate *tableDataDelegate;
@property (nonatomic, strong) NSMutableArray *students;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation ViewController
- (NSMutableArray *)students {
    if (!_students) {
        _students = [NSMutableArray array];
        for (int i = 0; i<10; i++) {
            Student *student = [Student new];
            student.name = [NSString stringWithFormat:@"jack-%d",i];
            student.age = i;
            student.height = 80 + i *5;
            [_students addObject:student];
        }
    }
    return _students;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configureTableView {
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.tableView.tableFooterView = [UIView new];
    [self.view addSubview:self.tableView];
    
    TableViewCellConfigureBlock configureCell = ^(NSIndexPath *indexPath, Student *student, UITableViewCell *cell) {
        [cell configure:cell customObj:student indexPath:indexPath];
    };
    
    CellHeightBlock cellHeight = ^CGFloat(NSIndexPath *indexPath, id item) {
        return [StudentCell getCellHegithWithObjcet:item indexPath:indexPath];
    };
    
    DidSelectCellBlock cellDidSelect = ^(NSIndexPath *indexPath, id item) {
        NSLog(@"click name : %@",((Student *)item).name) ;
        
    };
    
    self.tableDataDelegate = [[CXTableDataDelegate alloc]initWithItem:self.students cellIdentifier:@"StudentCell" configureCellBlock:configureCell cellHeight:cellHeight cellDidSelect:cellDidSelect];
    
    [self.tableDataDelegate handleTableViewDataSourceDelegate:self.tableView];
}


@end
