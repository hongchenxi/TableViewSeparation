//
//  StudentCell.m
//  Tableview分离
//
//  Created by 晨希 on 16/10/26.
//  Copyright © 2016年 cx. All rights reserved.
//

#import "StudentCell.h"
#import "Student.h"

@interface StudentCell()
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *age;
@end

@implementation StudentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configure:(UITableViewCell *)cell customObj:(id)obj indexPath:(NSIndexPath *)indexPath {
    Student *student = (Student *)obj;
    StudentCell *studentCell = (StudentCell *)cell;
    studentCell.name.text = student.name;
    studentCell.age.text = [NSString stringWithFormat:@"%ld岁",student.age];
}

+ (CGFloat)getCellHegithWithObjcet:(id)object indexPath:(NSIndexPath *)indexPath {
    return ((Student *)object).height ;
}

@end
