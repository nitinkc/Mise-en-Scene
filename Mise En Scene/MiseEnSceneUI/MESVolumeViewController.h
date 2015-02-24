//
//  MESArticleViewController.h
//  MiseEnSceneUI
//
//  Created by ichi chu on 11/16/13.
//  Copyright (c) 2013 ichi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MESArticle.h"

@interface MESVolumeViewController : UITableViewController
    
/*@property (nonatomic, strong) NSMutableArray *articles;
@property (nonatomic, strong) NSString *selectedVolume;*/
@property (nonatomic, strong) NSMutableArray* articlesForDisplay;

@property (nonatomic,strong) NSMutableArray * json;
@property (nonatomic,strong) NSMutableArray * articleArray;
@property (nonatomic, strong) NSString *selectedJournal;
@property(strong,nonatomic) IBOutlet UITableView *myTableView;
    
@end

