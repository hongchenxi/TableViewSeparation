//
//  CXTableDataDelegate.h
//  Tableview分离
//
//  Created by 晨希 on 16/10/26.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^TableViewCellConfigureBlock)(NSIndexPath *indexPath, id item, UITableViewCell *cell);
typedef CGFloat(^CellHeightBlock)(NSIndexPath *indexPath, id item);
typedef void(^DidSelectCellBlock)(NSIndexPath *indexPath, id item);

@interface CXTableDataDelegate : NSObject <UITableViewDataSource,UITableViewDelegate>

- (instancetype)initWithItem:(NSArray *)items
              cellIdentifier:(NSString *)identifier
          configureCellBlock:(TableViewCellConfigureBlock)configureCellBlock
                  cellHeight:(CellHeightBlock)cellHeightBlock
               cellDidSelect:(DidSelectCellBlock)cellDidSelectBlock;

- (void)handleTableViewDataSourceDelegate:(UITableView *)tableView;

@end
