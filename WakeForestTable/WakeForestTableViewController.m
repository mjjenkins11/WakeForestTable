//
//  WakeForestTableViewController.m
//  WakeForestTable
//
//  Created by Melissa Jenkins on 8/6/12.
//  Copyright (c) 2012 Synaptian. All rights reserved.
//

#import "WakeForestTableViewController.h"

@interface WakeForestTableViewController ()

@end

@implementation WakeForestTableViewController

@synthesize songsFromUserDevice = _songsFromUserDevice;



-(void)setSongsFromUserDevice:(NSArray *)songsFromUserDevice
{
    if(_songsFromUserDevice != songsFromUserDevice)
    {
        _songsFromUserDevice = songsFromUserDevice;
        [self.tableView reloadData];
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    return self;
}

//This method retrieves the songs from the user's library and can be edited with different types of filters
-(void)querySongs
{
    //creates a query for the media items retrieved from the user's device
    MPMediaQuery *everything = [[MPMediaQuery alloc] init];
    NSArray *itemsFromGenericQuery = [everything items];
    
    //Assigns the songsFromUserDevice property to the query 
    self.songsFromUserDevice = itemsFromGenericQuery;
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //call the querySongs method to retrieve the songs from the user's library
    [self querySongs];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.songsFromUserDevice = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.songsFromUserDevice count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Song";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    //Takes the song's title from the MPMediaItem array and assigns it to the cell's label
    NSString *songTitle = [[self.songsFromUserDevice objectAtIndex:indexPath.row] valueForProperty:MPMediaItemPropertyTitle];    
    cell.textLabel.text = songTitle;
    
    //Creates a UIImage for the artwork of the MPMediaItem
    CGSize size = CGSizeMake(500, 50);
    MPMediaItemArtwork *artwork = [[self.songsFromUserDevice objectAtIndex:indexPath.row]valueForProperty:MPMediaItemPropertyArtwork];    
    UIImage *artworkImage = [artwork imageWithSize:size];
    
    //If there is no image, a generic image is assigned to the item and the image is assigned to the cell's image
    if(!artworkImage)
    {
        artworkImage = [UIImage imageNamed:@"noArtwork.png"];
    }
    cell.imageView.image = artworkImage;
    
    return cell;
}


/*#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}*/

@end
