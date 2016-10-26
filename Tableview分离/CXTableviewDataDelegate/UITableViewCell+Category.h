//
//  UITableViewCell+Category.h
//  Tableview分离
//
//  Created by 晨希 on 16/10/26.
//  Copyright © 2016年 cx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (Category)

+ (void)registerTableView:(UITableView *)tableView nibIdentifier:(NSString *)identifier;

- (void)configure:(UITableViewCell *)cell customObj:(id)obj indexPath:(NSIndexPath *)indexPath;

+ (CGFloat)getCellHegithWithObjcet:(id)object indexPath:(NSIndexPath *)indexPath;

@end
