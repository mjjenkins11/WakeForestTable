//
//  WakeForestTableViewController.h
//  WakeForestTable
//
//  Created by Melissa Jenkins on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface WakeForestTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *songsFromUserDevice; //an array of MPMediaItems retrieved from the user's device

@end
