//
//  YASelectionTableViewCell.m
//  YACSiOS
//
//  Created by james grippo on 10/9/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "YASelectionTableViewCell.h"

@implementation YASelectionTableViewCell

@synthesize Label;

-(instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        Label = [[UILabel alloc] init];
        [self.contentView addSubview:Label];        
        
        
        [Label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(30);
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
