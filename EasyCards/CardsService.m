//
//  CardsService.m
//  EasyCards
//
//  Created by Mohammad Azam on 12/2/13.
//  Copyright (c) 2013 Mohammad Azam. All rights reserved.
//

#import "CardsService.h"

@implementation CardsService

-(NSMutableArray *) getAll
{
    NSMutableArray *cards = [[NSMutableArray alloc] init];
    
    Card *johnDoeCard = [[Card alloc] init];
    johnDoeCard.name = @"John Doe";
    
    Card *maryKateCard = [[Card alloc] init];
    maryKateCard.name = @"Mary Kate";
    
    [cards addObject:johnDoeCard];
    [cards addObject:maryKateCard];
    
    return cards;
}

@end
