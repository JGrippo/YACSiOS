//
//  YACatalogTableViewCell.m
//  YACSiOS
//
//  Created by james grippo on 9/29/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import "YACatalogTableViewCell.h"

@implementation YACatalogTableViewCell

@synthesize boldLabel, descriptionLabel;

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        [self setSelectionStyle:UITableViewCellSelectionStyleNone];
        
        boldLabel = [[UILabel alloc] init];
        
        descriptionLabel = [[UILabel alloc] init];
        
        [self.contentView addSubview:descriptionLabel];
        [descriptionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(0, 80, 0, 0));
            //make.centerY.equalTo(self.contentView.mas_centerY);
            
        }];
        
        [self.contentView addSubview:boldLabel];
        [boldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentView.mas_left).with.offset(20);
            make.right.equalTo(descriptionLabel.mas_left);
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
