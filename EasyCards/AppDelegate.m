//
//  AppDelegate.m
//  EasyCards
//
//  Created by Mohammad Azam on 11/29/13.
//  Copyright (c) 2013 Mohammad Azam. All rights reserved.
//

#import "AppDelegate.h"

NSString *const kServiceType = @"az-easycards";
NSString *const CardReceivedNotification = @"CardReceivedNotification";

@interface AppDelegate()

@property (nonatomic,strong) MCAdvertiserAssistant *advertiserAssistant;

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self setup];
    return YES;
}

-(void) setup
{
    [[PeerHelper sharedHelper] initialize];
    
}

//-(void) sendCardToPeer
//{
//    Card *card = [[Card alloc] init];
//    card.firstName = @"Mary";
//    card.lastName = @"Kate";
//    
//    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:card];
//
//    [self.session sendData:data toPeers:[self.session connectedPeers] withMode:MCSessionSendDataReliable error:nil];
//}

//- (void)session:(MCSession *)session peer:(MCPeerID *)peerID didChangeState:(MCSessionState)state
//{
//    
//}
//
//-(void) session:(MCSession *)session didReceiveData:(NSData *)data fromPeer:(MCPeerID *)peerID
//{
//    Card *card = (Card *) [NSKeyedUnarchiver unarchiveObjectWithData:data];
//    
//    NSLog(@"%@",card.firstName);
//    NSLog(@"%@",card.lastName);
//}
//
//-(void) session:(MCSession *)session didReceiveStream:(NSInputStream *)stream withName:(NSString *)streamName fromPeer:(MCPeerID *)peerID
//{
//    
//}
//
//-(void) session:(MCSession *)session didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
//{
//    
//}
//
//-(void) session:(MCSession *)session didFinishReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID atURL:(NSURL *)localURL withError:(NSError *)error
//{
//    
//}
//
//-(void) startAdvertising
//{
//    self.peerID = [[MCPeerID alloc] initWithDisplayName:@"Mohammad Azam"];
//    self.session = [[MCSession alloc]  initWithPeer:self.peerID];
//    self.session.delegate = self;
//    
  //  self.advertiserAssistant = [[MCAdvertiserAssistant alloc] initWithServiceType:kServiceType discoveryInfo:nil session:self.session];
//    
//    [self.advertiserAssistant start];
//}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
