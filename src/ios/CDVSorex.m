/*
 Licensed to the Apache Software Foundation (ASF) under one
 or more contributor license agreements.  See the NOTICE file
 distributed with this work for additional information
 regarding copyright ownership.  The ASF licenses this file
 to you under the Apache License, Version 2.0 (the
 "License"); you may not use this file except in compliance
 with the License.  You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing,
 software distributed under the License is distributed on an
 "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 KIND, either express or implied.  See the License for the
 specific language governing permissions and limitations
 under the License.
 */

#include <sys/types.h>
#include <sys/sysctl.h>
#include "TargetConditionals.h"

#import <MultipeerConnectivity/MultipeerConnectivity.h>

#import <Cordova/CDV.h>
#import "CDVSorex.h"

@implementation CDVSorex

MCSession *_session;
MCNearbyServiceAdvertiser *serviceAdvertiser;


- (void)activateVisibility:(CDVInvokedUrlCommand*)command
{
    NSString *displayName = [[UIDevice currentDevice] name];
    
    // OLD: peer = new MCPeerID(UIKit.UIDevice.CurrentDevice.Name);
    MCPeerID *peerID = [[MCPeerID alloc] initWithDisplayName:displayName];
    // OLD: session = new MCSession(peer);
    _session = [[MCSession alloc] initWithPeer:peerID securityIdentity:nil encryptionPreference:MCEncryptionRequired];
    // OLD: session.Delegate = this;
    _session.delegate = self;
    // OLD: serviceAdvertiser = new MCNearbyServiceAdvertiser(peer, null, "sorex-visible");
    serviceAdvertiser = [[MCNearbyServiceAdvertiser alloc] initWithPeer:peerID discoveryInfo:nil serviceType:@"sorex-visible"];
    // OLD: serviceAdvertiser.Delegate = this;
    serviceAdvertiser.delegate = self;
    // OLD: serviceAdvertiser.StartAdvertisingPeer();
    serviceAdvertiser.startAdvertisingPeer;
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          @"OK", @"Init", displayName, @"displayName", nil];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)advertiser:(MCNearbyServiceAdvertiser *)advertiser didReceiveInvitationFromPeer:(MCPeerID *)peerID withContext:(NSData *)context invitationHandler:(void(^)(BOOL accept, MCSession *session))invitationHandler
{
}

- (void)session:(MCSession *)session
 didReceiveData:(NSData *)data
       fromPeer:(MCPeerID *)peerID
{
}

- (void)session:(MCSession *)session
didReceiveStream:(NSInputStream *)stream
       withName:(NSString *)streamName
       fromPeer:(MCPeerID *)peerID
{
}

- (void)session:(MCSession *)session
didStartReceivingResourceWithName:(NSString *)resourceName fromPeer:(MCPeerID *)peerID withProgress:(NSProgress *)progress
{
}

- (void)session:(MCSession *)session
           peer:(MCPeerID *)peerID
 didChangeState:(MCSessionState)state
{
}

- (void)session:(MCSession *)session
didFinishReceivingResourceWithName:(NSString *)resourceName
       fromPeer:(MCPeerID *)peerID
          atURL:(NSURL *)localURL
      withError:(NSError *)error
{
}

@end
