//
//  Peer.h
//  EasyCards
//
//  Created by Mohammad Azam on 12/3/13.
//  Copyright (c) 2013 Mohammad Azam. All rights reserved.
//

#import <Foundation/Foundation.h>
@import MultipeerConnectivity;
#import "Card.h"

@interface Peer : NSObject
{
    
}

@property (nonatomic,strong) MCPeerID *peerId;
@property (nonatomic,strong) MCSession *session;
@property (nonatomic,strong) MCAdvertiserAssistant *assistant;

@end
