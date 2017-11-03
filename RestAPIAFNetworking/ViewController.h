//
//  ViewController.h
//  RestAPIAFNetworking
//
//  Created by SpaceBasic on 3/11/17.
//  Copyright © 2017 SpaceBasic. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(strong , nonatomic) NSArray *data;
@property(strong , nonatomic) NSMutableDictionary *DicData;

@end

