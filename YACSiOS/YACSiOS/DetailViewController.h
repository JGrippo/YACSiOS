//
//  DetailViewController.h
//  YACSiOS
//
//  Created by james grippo on 9/20/15.
//  Copyright © 2015 james grippo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

