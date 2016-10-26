//
//  CXTableDataDelegate.m
//  Tableview分离
//
//  Created by 晨希 on 16/10/26.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "CXTableDataDelegate.h"
#import "UITableViewCell+Category.h"

@interface CXTableDataDelegate ()
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic ,copy) TableViewCellConfigureBlock cellConfigureBlock;
@property (nonatomic, copy) CellHeightBlock cellhecightBlock;
@property (nonatomic, copy) DidSelectCellBlock cellDidSelectBlock;
@end

@implementation CXTableDataDelegate

- (instancetype)initWithItem:(NSArray *)items
              cellIdentifier:(NSString *)identifier
          configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
                  cellHeight:(CellHeightBlock)cellHeightBlock
               cellDidSelect:(DidSelectCellBlock)cellDidSelectBlock {
    if (self = [super init]) {
        self.items = items;
        self.cellIdentifier = identifier;
        self.cellConfigureBlock = configureCellBlock;
        self.cellhecightBlock = cellHeightBlock;
        self.cellDidSelectBlock = cellDidSelectBlock;
    }
    return self;
}

- (instancetype)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[indexPath.row];
}

- (void)handleTableViewDataSourceDelegate:(UITableView *)tableView {
    tableView.dataSource = self;
    tableView.delegate = self;
}

#pragma mark - TableView DataSouce

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self itemAtIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    if (!cell) {
        [UITableViewCell registerTableView:tableView nibIdentifier:self.cellIdentifier];
        cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier];
    }
    self.cellConfigureBlock(indexPath, item, cell);
    
    return cell;
}

#pragma mark - TableView Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id item = [self itemAtIndexPath:indexPath];
    return self.cellhecightBlock(indexPath, item);
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    id item = [self itemAtIndexPath:indexPath];
    self.cellDidSelectBlock(indexPath, item);
}
@end
