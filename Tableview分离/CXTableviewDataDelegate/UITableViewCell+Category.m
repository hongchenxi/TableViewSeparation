//
//  UITableViewCell+Category.m
//  Tableview分离
//
//  Created by 晨希 on 16/10/26.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "UITableViewCell+Category.h"

@implementation UITableViewCell (Category)

+ (UINib *)nibWithIdentifier:(NSString *)identifier {
    return [UINib nibWithNibName:identifier bundle:nil];
}

+ (void)registerTableView:(UITableView *)tableView nibIdentifier:(NSString *)identifier {
    [tableView registerNib:[self nibWithIdentifier:identifier] forCellReuseIdentifier:identifier];
}

- (void)configure:(UITableViewCell *)cell customObj:(id)obj indexPath:(NSIndexPath *)indexPath {
    
}

+ (CGFloat)getCellHegithWithObjcet:(id)object indexPath:(NSIndexPath *)indexPath {
    if (!object) {
        return 0.0;
    }
    return 44.0;
}

@end
