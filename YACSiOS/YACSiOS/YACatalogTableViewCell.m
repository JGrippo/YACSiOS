//
//  YACatalogTableViewCell.m
//  YACSiOS
//
//  Created by james grippo on 9/29/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "YACatalogTableViewCell.h"

@implementation YACatalogTableViewCell

@synthesize boldTextField, descriptionTextField;

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        boldTextField = [[UITextField alloc] init];
        
        descriptionTextField = [[UITextField alloc] init];
        
        [self.contentView addSubview:descriptionTextField];
        [descriptionTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(0, 70, 0, 0));
            //make.centerY.equalTo(self.contentView.mas_centerY);
            
        }];
        
        [self.contentView addSubview:boldTextField];
        [boldTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(20);
            make.right.equalTo(descriptionTextField.mas_left);
            make.centerY.equalTo(self.contentView.mas_centerY).with.offset(-1);
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
