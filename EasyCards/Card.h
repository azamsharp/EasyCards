//
//  Card.h
//  EasyCards
//
//  Created by Mohammad Azam on 11/30/13.
//  Copyright (c) 2013 Mohammad Azam. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Card : NSObject
{
    
}

@property (nonatomic,copy) NSString *name; 
@property (nonatomic,copy) NSString *firstName;
@property (nonatomic,copy) NSString *lastName;


+(Card *) cardFromArchive;

-(void) archive;

@end
