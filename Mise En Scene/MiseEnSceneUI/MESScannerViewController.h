//
//  MESScannerViewController.h
//  MiseEnSceneUI
//
//  Created by ichi chu on 11/18/13.
//  Copyright (c) 2013 ichi. All rights reserved.
//
//I-Chi: This class implements the metaio SDK viewController, handles the scanner
#import <UIKit/UIKit.h>
#import "MetaioSDKViewController.h"
#import "EAGLView.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h> //alternate movie method

@interface MESScannerViewController : MetaioSDKViewController

@property (nonatomic) metaio::IGeometry *playButtonModel;
- (IBAction)exitButton:(id)sender;

@end
