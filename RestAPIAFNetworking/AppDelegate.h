//
//  AppDelegate.h
//  RestAPIAFNetworking
//
//  Created by SpaceBasic on 3/11/17.
//  Copyright © 2017 SpaceBasic. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

