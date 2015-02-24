//
//  Article.h
//  MiseEnSceneUI
//
//  Created by Nitin Chaurasia on 11/28/13.
//  Copyright (c) 2013 ichi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Article : NSObject


@property (nonatomic,strong)NSString* Article_ID;
@property (nonatomic,strong)NSString* Article_Name;
@property (nonatomic,strong)NSString* Journal_Name;
@property (nonatomic,strong)NSString* Volume_No;
@property (nonatomic,strong)NSString* Issue_No;
@property (nonatomic,strong)NSString* Author;

//Methods

-(id) initWithArticle_ID: (NSString *) aID andArticle_Name: (NSString *) aName andJournal_Name: (NSString *) jName andVolume_No: (NSString *) vNo andIssue_No: (NSString *) iNo andAuthor: (NSString *) author ;

@end
