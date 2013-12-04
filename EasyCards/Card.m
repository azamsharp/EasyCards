//
//  Card.m
//  EasyCards
//
//  Created by Mohammad Azam on 11/30/13.
//  Copyright (c) 2013 Mohammad Azam. All rights reserved.
//

#import "Card.h"

@interface Card()<NSCoding>

@end

@implementation Card

-(void) encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.firstName forKey:@"firstName"];
    [encoder encodeObject:self.lastName forKey:@"lastName"];
    [encoder encodeObject:self.name forKey:@"name"];
}

-(void) archive
{
   NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self];
   
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    [standardDefaults setObject:data forKey:@"Card"];
    [standardDefaults synchronize];
}

+(Card *) cardFromArchive
{
    NSUserDefaults *standardDefaults = [NSUserDefaults standardUserDefaults];
    
    NSData *data = [standardDefaults valueForKey:@"Card"];
    
    if(data == nil) return nil;
    
   return (Card *) [NSKeyedUnarchiver unarchiveObjectWithData:[standardDefaults valueForKey:@"Card"]];
}

-(instancetype) initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    
    [self setFirstName:[decoder decodeObjectForKey:@"firstName"]];
    [self setLastName:[decoder decodeObjectForKey:@"lastName"]];
    [self setName:[decoder decodeObjectForKey:@"name"]];
    
    return self;
}


@end
