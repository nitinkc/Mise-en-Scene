//
//  MESArticleViewController.m
//  MiseEnSceneUI
//
//  Created by ichi chu on 11/16/13.
//  Copyright (c) 2013 ichi. All rights reserved.
//
// ArticleViewController displays the articles within the selected volume.

#import "MESVolumeViewController.h"
#import "MESArticle.h"
#import "MESArticleDetailViewController.h"

#define dataURL @"http://agiledev1.bgsu.edu/~nitinc/json.php"

@interface MESVolumeViewController ()

@end

@implementation MESVolumeViewController
@synthesize json, articleArray, myTableView, selectedJournal,articlesForDisplay;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [self retrieveData];
    [super viewDidLoad];
    self.articlesForDisplay = [[NSMutableArray alloc] init];
    NSLog(@"number of article is %i", articlesForDisplay.count);
    NSLog(@"NITIN TEST %@",selectedJournal);
    NSLog(@"number of article is %i", articleArray.count);
    //determining which articles are in the selected volume and put them in the array _articlesForDisplay
    for (int i=0; i<articleArray.count; i++) {
        MESArticle *anArticle = [articleArray objectAtIndex:i];
        if (anArticle.Journal_Name == selectedJournal) {
            [articlesForDisplay addObject:[articleArray objectAtIndex:i]];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return articleArray.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier=@"articleCell";
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==Nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
   
    MESArticle * currentAuthor = [articleArray  objectAtIndex:indexPath.row];
    //NSLog(@"Hello%@",indexPath.row);
    //if (currentAuthor.Journal_Name == selectedJournal){
    //NSString *query=[NSString stringWithFormat:@"SELECT * FROM Article WHERE Journal_Name='@%'",selectedVolume];
    cell.textLabel.text = currentAuthor.Volume_No ;
    cell.detailTextLabel.text = currentAuthor.Issue_No ;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   // }
    return cell;
    
}

# pragma mark - UITableView Delegate methods

- (void) tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - Methods

- (void) retrieveData{
    
    NSURL * url= [NSURL URLWithString:dataURL];
    NSData * data= [NSData dataWithContentsOfURL:url];
    json =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:Nil];
    
    //Populating Article array
    articleArray = [[NSMutableArray alloc]init];
    
    for (int i=0; i<json.count; i++) {
        
        // Create a article object
        NSString  * aID = [[json objectAtIndex:i]objectForKey:@"Article_ID"];
        NSString  * aName = [[json objectAtIndex:i]objectForKey:@"Article_Name"];
        NSString  * jName = [[json objectAtIndex:i]objectForKey:@"Journal_Name"];
        NSString  * vNo = [[json objectAtIndex:i]objectForKey:@"Volume_No"];
        NSString  * iNo = [[json objectAtIndex:i]objectForKey:@"Issue_No"];
        NSString  * author = [[json objectAtIndex:i]objectForKey:@"Author"];
        
        MESArticle *myArticle = [[MESArticle alloc] initWithArticle_ID:aID andArticle_Name:aName andJournal_Name:jName andVolume_No:vNo andIssue_No:iNo andAuthor:author];
            //Add our Article object to Article array
            [articleArray addObject:myArticle];
        
    
    }
    
    //[self.myTableView reloadData];
}

@end
