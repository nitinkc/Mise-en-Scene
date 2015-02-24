//
//  MESScannerViewController.m
//  MiseEnSceneUI
//
//  Created by ichi chu on 11/18/13.
//  Copyright (c) 2013 ichi. All rights reserved.
//

#import "MESScannerViewController.h"

@interface MESScannerViewController ()

@end

@implementation MESScannerViewController

AVPlayer *myMovie;

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
	// Do any additional setup after loading the view.
    
	// Load all the models we need, at the loading phase so that we gain some time when the application is running
	[self loadModels];
	
	// Load the first tracking configuration file at first
	[self loadTrackingConfigurationFiles];
}

- (void) loadModels
{
	// trigger picture resource path
	NSString* playButtonResourcePath = [[NSBundle mainBundle] pathForResource:@"s-play" ofType:@"obj" inDirectory:@"Assets"];
    
	// If the resource is found
	if(playButtonResourcePath)
	{
		// if this call was successful, _playButtonModel will contain a pointer to the 3D model
		_playButtonModel =  m_metaioSDK->createGeometry([playButtonResourcePath UTF8String]);
		if( _playButtonModel )
		{
			// scale it a bit up
			_playButtonModel ->setScale(metaio::Vector3d(100.0,100.0,100.0));
			// Set it visible
			_playButtonModel ->setVisible(true);
		}
		else
		{
			NSLog(@"error, could not load %@", playButtonResourcePath);
		}
	}
}

-(void) loadTrackingConfigurationFiles
{
    NSString* markerlessTrackingFile = [[NSBundle mainBundle] pathForResource:@"markerless_tracking" ofType:@"xml"
                                                                  inDirectory:@"Assets/tracking"];
    if (markerlessTrackingFile) {
        bool success = m_metaioSDK->setTrackingConfiguration([markerlessTrackingFile UTF8String]);
        if (!success) {
            NSLog(@"no success loading tracking configuration");
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**************
 *Function to handle touch event on the augmented marker
 ************/
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // Here's how to pick a geometry
	UITouch *touch = [touches anyObject];
	CGPoint loc = [touch locationInView:glView];
    
    // get the scale factor (will be 2 for retina screens)
    float scale = glView.contentScaleFactor;
    
	// ask sdk if the user picked an object
	// the 'true' flag tells sdk to actually use the vertices for a hit-test, instead of just the bounding box
    metaio::IGeometry* model = m_metaioSDK->getGeometryFromScreenCoordinates(loc.x * scale, loc.y * scale, true);
    
    if ( model == _playButtonModel)
	{
		// button touched
		// let's play the movie
		NSLog(@"you touched the play button");
        [self playVideo];
	}
}

-(void) playVideo
{
    //url is the path to the video (local)
    NSURL *url=[NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"Assets/KuhleWampeAvClip" ofType:@"mp4"]];
    MPMoviePlayerViewController *playerController = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    [self presentMoviePlayerViewControllerAnimated:playerController];
    playerController.moviePlayer.movieSourceType = MPMovieSourceTypeFile;
    [playerController.moviePlayer play];
    playerController = nil;

}

//button for exiting the camera view
- (IBAction)exitButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
