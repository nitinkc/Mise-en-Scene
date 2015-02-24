/*
This table view controller controls the screen for volume selection.
It allocates an array of articles, initialze it, and use the volume information to
 construct cells. When a cell is selected, the volume information is stored and passed to the next view controller (for articles).
*/
#import "MESJournalViewController.h"
#import "MESVolumeViewController.h"
#import "MESArticle.h"

@interface MESJournalViewController ()

@end

NSMutableArray *allVolumes;

#define dataURL @"http://agiledev1.bgsu.edu/~nitinc/json.php"

@implementation MESJournalViewController

@synthesize json, articleArray, myTableView,selectedJournal;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //set the title
    self.title = @"Journals";
    [self retrieveData];
}

//Method thats called before segueing to next view, passing relevant data
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showArticles"]) {
        MESVolumeViewController *destViewController = segue.destinationViewController;
        //putting existing Journals in an array---------------------------
        allVolumes = [[NSMutableArray alloc] init];
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        self.selectedJournal= [[NSMutableArray alloc] init];
        NSLog(@"number of volume is %i", allVolumes.count);
        //Passing the selected Journal-------------------
        MESArticle *tempArticle3 = [articleArray objectAtIndex:indexPath.row];
        destViewController.selectedJournal = tempArticle3.Journal_Name;
        //Passing the array of articles--------------------------------------------
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
    static NSString *cellIdentifier=@"cell";
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell==Nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    //Retrieve current article object for use with this indexPath.row
    MESArticle * currentAuthor = [articleArray objectAtIndex:indexPath.row];
    //cell.textLabel.text = currentAuthor.Volume_No;
    cell.textLabel.text = currentAuthor.Journal_Name;
    cell.detailTextLabel.text = currentAuthor.Issue_No ;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
/* 
 Connaction to JSON.php and retrival of Data happening
 Everything is collected inside the articalArray which is the object of MESArtical.h
*/
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
    
    [self.myTableView reloadData];
}


@end
