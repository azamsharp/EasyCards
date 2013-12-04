//
//  CardsViewController.h
//  EasyCards
//
//  Created by Mohammad Azam on 12/2/13.
//  Copyright (c) 2013 Mohammad Azam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardsService.h"
#import "Card.h"
#import "CardCell.h"
#import "AppDelegate.h"
#import <MultipeerConnectivity/MultipeerConnectivity.h>

@interface CardsViewController : UITableViewController
{
    CardsService *_cardsService;
    NSMutableArray *_cards;
}
@end
