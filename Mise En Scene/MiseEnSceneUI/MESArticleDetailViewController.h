//
//  MESArticleDetailViewController.h
//  MiseEnSceneUI
//
//  Created by ichi chu on 11/17/13.
//  Edited by Nitin/Mahak 0n 11/24/13
//  Copyright (c) 2013 ichi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MESArticle.h"

@interface MESArticleDetailViewController : UIViewController

@property (nonatomic, strong) MESArticle *selectedArticle;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *volumeLabel;


@end
