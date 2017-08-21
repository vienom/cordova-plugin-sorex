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

- (void)activateVisibility:(CDVInvokedUrlCommand*)command
{
    /*peer = new MCPeerID(UIKit.UIDevice.CurrentDevice.Name);
     session = new MCSession(peer);
     session.Delegate = this;
     serviceAdvertiser = new MCNearbyServiceAdvertiser(peer, null, "sorex-visible");
     serviceAdvertiser.Delegate = this;
     serviceAdvertiser.StartAdvertisingPeer();*/
    
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          @"OK", @"Init", nil];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsDictionary:dict];
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


@end
