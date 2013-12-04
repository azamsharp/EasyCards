//
//  CardsViewController.m
//  EasyCards
//
//  Created by Mohammad Azam on 12/2/13.
//  Copyright (c) 2013 Mohammad Azam. All rights reserved.
//

#import "CardsViewController.h"

@interface CardsViewController ()<MCBrowserViewControllerDelegate>

@end

@implementation CardsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(refresh:) name:@"CardReceivedNotification" object:nil];
    
    _cardsService = [[CardsService alloc] init];
    _cards = [_cardsService getAll];
}

-(void) refresh:(NSNotification *) notification
{
    Card *card = (Card *) [notification.userInfo valueForKey:@"Card"];
    [_cards addObject:card];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 80.0;
}

- (void)browserViewControllerWasCancelled:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:nil];
}

-(void) browserViewControllerDidFinish:(MCBrowserViewController *)browserViewController
{
    [browserViewController dismissViewControllerAnimated:YES completion:^{
        [[PeerHelper sharedHelper] sendData];
    }];
}

-(void) browseButtonClicked:(id) sender
{
   // open up the browsing services
    MCBrowserViewController *browserViewController = [[MCBrowserViewController alloc] initWithServiceType:kServiceType session:[[PeerHelper sharedHelper] peer].session];
    browserViewController.delegate = self;
    
    [self presentViewController:browserViewController animated:YES completion:nil];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    UIView *footer = [[UIView alloc] initWithFrame:CGRectZero];
    footer.backgroundColor = [UIColor lightGrayColor];
    
    
    UIButton *browseButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [browseButton addTarget:self action:@selector(browseButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [browseButton setTitle:@"Browse" forState:UIControlStateNormal];
    browseButton.frame = CGRectMake(0, 25, self.view.frame.size.width, 30);
    browseButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    
    [footer addSubview:browseButton];
    
    return footer;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_cards count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CardCell";
    CardCell *cell = (CardCell *) [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    Card *card = [_cards objectAtIndex:[indexPath row]];
    
    cell.nameLabel.text = [NSString stringWithFormat:@"%@",card.name];
    
    return cell;
}

@end
