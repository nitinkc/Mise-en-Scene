//
//  MESArticleDetailViewController.m
//  MiseEnSceneUI
//
//  Created by ichi chu on 11/17/13.
//  Copyright (c) 2013 ichi. All rights reserved.
//

#import "MESArticleDetailViewController.h"
#import "MESArticle.h"

@interface MESArticleDetailViewController ()

@end

@implementation MESArticleDetailViewController

@synthesize selectedArticle;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _titleLabel.text = selectedArticle.Article_Name;
    _authorLabel.text = selectedArticle.Author;
    _volumeLabel.text = selectedArticle.Volume_No;
    
    NSLog(@"%@", selectedArticle.Article_Name );
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
