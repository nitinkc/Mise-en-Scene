//
//  MESArticle.m
//  MiseEnSceneUI
//
//  Created by ichi chu on 11/16/13.
//  Copyright (c) 2013 ichi. All rights reserved.
//

#import "MESArticle.h"

@implementation MESArticle

@synthesize Article_ID,Article_Name,Journal_Name,Volume_No,Issue_No,Author;

-(id) initWithArticle_ID: (NSString *) aID andArticle_Name: (NSString *) aName andJournal_Name: (NSString *) jName andVolume_No: (NSString *) vNo andIssue_No: (NSString *) iNo andAuthor: (NSString *) author
{
    self = [super init];
    if(self){
        Article_ID  = aID;
        Article_Name = aName;
        Journal_Name = jName;
        Volume_No   = vNo;
        Issue_No    = iNo;
        Author      =  author;
    }
    return self;
}

@end
