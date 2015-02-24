//
//  MESVolumeViewController.h
//  MiseEnSceneUI
//
//  Created by ichi chu on 11/16/13.
//  Copyright (c) 2013 ichi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MESArticle.h"

@interface MESJournalViewController : UITableViewController

<UITableViewDataSource, UITableViewDelegate>
//@property NSMutableArray *articleArray; //I-chi

/*Changes to include Data from MySql Server*/
@property (nonatomic,strong) NSMutableArray * json;
@property (nonatomic,strong) NSMutableArray * articleArray;
@property (nonatomic,strong) NSMutableArray * selectedJournal;
@property(strong,nonatomic) IBOutlet UITableView *myTableView;

#pragma mark - Methods

- (void) retrieveData;
/*Changes made till here to include Data from MySql Server*/


@end
