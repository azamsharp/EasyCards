//
//  AppDelegate.h
//  EasyCards
//
//  Created by Mohammad Azam on 11/29/13.
//  Copyright (c) 2013 Mohammad Azam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Card.h"
#import "Peer.h"
#import "PeerHelper.h"
#import <MultipeerConnectivity/MultipeerConnectivity.h>

extern NSString *const kServiceType;
extern NSString *const CardReceivedNotification;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong) MCSession *session;
@property (nonatomic,strong) MCPeerID *peerID;

-(void) setup;


@end
