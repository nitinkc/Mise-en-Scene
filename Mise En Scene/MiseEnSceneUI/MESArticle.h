//
//  MESArticle.h
//  MiseEnSceneUI
//
//  Created by ichi chu on 11/16/13.
//  Copyright (c) 2013 ichi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MESArticle : NSObject

@property (nonatomic,strong)NSString* Article_ID;
@property (nonatomic,strong)NSString* Article_Name; //name
@property (nonatomic,strong)NSString* Journal_Name;
@property (nonatomic,strong)NSString* Volume_No; //volume
@property (nonatomic,strong)NSString* Issue_No;
@property (nonatomic,strong)NSString* Author; //author

//Methods

-(id) initWithArticle_ID: (NSString *) aID andArticle_Name: (NSString *) aName andJournal_Name: (NSString *) jName andVolume_No: (NSString *) vNo andIssue_No: (NSString *) iNo andAuthor: (NSString *) author ;

@end
