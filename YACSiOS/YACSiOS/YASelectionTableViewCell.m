//
//  YASelectionTableViewCell.m
//  YACSiOS
//
//  Created by james grippo on 10/9/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "YASelectionTableViewCell.h"

@implementation YASelectionTableViewCell

@synthesize textField, YASwitch;

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        textField = [[UITextField alloc] init];
        [textField setPlaceholder:@"Selected Courses"];
        [self.contentView addSubview:textField];        
        
        YASwitch = [[UISwitch alloc] init];

        [self.contentView addSubview:YASwitch];
        
        [YASwitch mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(10);
            make.width.equalTo(@51);
            make.height.equalTo(@31);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(YASwitch.mas_right).with.offset(10);
            make.centerY.equalTo(self.contentView.mas_centerY);
        }];
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
