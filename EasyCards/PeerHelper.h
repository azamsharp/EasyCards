//
//  PeerHelper.h
//  EasyCards
//
//  Created by Mohammad Azam on 12/3/13.
//  Copyright (c) 2013 Mohammad Azam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Peer.h"
#import "Card.h"
#import "AppDelegate.h"


@interface PeerHelper : NSObject
{
    
}

@property (nonatomic,strong) Peer *peer;

-(void) initialize;
-(void) restart;
-(void) start;
-(void) stop;
-(void) sendData;

+(PeerHelper *) sharedHelper;

@end
