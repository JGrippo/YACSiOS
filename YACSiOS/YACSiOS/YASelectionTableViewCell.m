//
//  YASelectionTableViewCell.m
//  YACSiOS
//
//  Created by james grippo on 10/9/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "YASelectionTableViewCell.h"

@implementation YASelectionTableViewCell

@synthesize textField;

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        textField = [[UITextField alloc] init];
        [textField setPlaceholder:@"Selected Courses"];
        [self.contentView addSubview:textField];        
        
        
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(20);
            make.centerY.equalTo(self.contentView.mas_centerY).with.offset(-2);
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
