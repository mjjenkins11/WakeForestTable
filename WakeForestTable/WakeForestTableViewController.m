//
//  WakeForestTableViewController.m
//  WakeForestTable
//
//  Created by Melissa Jenkins on 8/6/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "WakeForestTableViewController.h"

@interface WakeForestTableViewController ()

@end

@implementation WakeForestTableViewController

@synthesize songTitles = _songTitles;



-(void)setSongTitles:(NSArray *)songTitles
{
    if(_songTitles != songTitles)
    {
        _songTitles = songTitles;
        [self.tableView reloadData];
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)querySongs
{
    MPMediaQuery *everything = [[MPMediaQuery alloc] init];
    NSArray *itemsFromGenericQuery = [everything items];
    
    self.songTitles = itemsFromGenericQuery;
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self querySongs];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.songTitles = nil;
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%d", [self.songTitles count]);
    return [self.songTitles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Song";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    
    
    NSString *songTitle = [[self.songTitles objectAtIndex:indexPath.row] valueForProperty:MPMediaItemPropertyTitle];    
    cell.textLabel.text = songTitle;
    
    /*
     Based on the song title, need to somehow find the image for the album
     */
    CGSize size = CGSizeMake(30, 30);
    MPMediaItemArtwork *artwork = [[self.songTitles objectAtIndex:indexPath.row]valueForProperty:MPMediaItemPropertyArtwork];    
    UIImage *artworkImage = [artwork imageWithSize:size];
    if(!artworkImage)
    {
        artworkImage = [UIImage imageNamed:@"noArtwork.png"];
    }
    cell.imageView.image = artworkImage;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
