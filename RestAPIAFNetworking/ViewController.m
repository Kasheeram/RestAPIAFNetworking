//
//  ViewController.m
//  RestAPIAFNetworking
//
//  Created by SpaceBasic on 3/11/17.
//  Copyright © 2017 SpaceBasic. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <AFURLResponseSerialization.h>


@interface ViewController ()
{
    NSMutableArray *array;
    __weak IBOutlet UITableView *tableView;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    array = [[NSMutableArray alloc]init];
    NSString * auth_id = @"F3227309950C09A98779";
    NSString * auth_token = @"AEA6DBF913391AE58E98DAC2524BB3EF3B76DFDD";
    NSString *baseURL = @"https://kitp.test.uniqolabel.co/api/mobile/v1/getProductCategoryDetails.php";
    NSDictionary *params = @{@"auth_id":auth_id , @"auth_token":auth_token };

    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager GET:@"http://jsonplaceholder.typicode.com/users" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        self.data = responseObject;
        //NSLog(@"JSON: %@", responseObject);
        int i;
        for(i=0;i<[self.data count];i++){
            NSMutableDictionary *Dic = [[NSMutableDictionary alloc] init];
             [Dic setObject: [[self.data objectAtIndex:i]objectForKey:@"email"] forKey: @"email"];
             [Dic setObject: [[self.data objectAtIndex:i]objectForKey:@"id"] forKey: @"id"];
             [Dic setObject: [[self.data objectAtIndex:i]objectForKey:@"name"] forKey: @"name"];
             [Dic setObject: [[self.data objectAtIndex:i]objectForKey:@"phone"] forKey: @"phone"];
             [Dic setObject: [[self.data objectAtIndex:i]objectForKey:@"website"] forKey: @"website"];
            [array insertObject:Dic atIndex:i];
            [self.tableView reloadData];
        }
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];

    
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    //manager.requestSerializer = [AFJSONRequestSerializer serializer];
//     manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
//    [manager POST:baseURL parameters:params progress:nil success:^(NSURLSessionTask *task, id responseObject) {
//        //        self.data = responseObject;
//        NSLog(@"JSON: %@", responseObject);
//        //NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
//    } failure:^(NSURLSessionTask *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    cell.textLabel.text = [array objectAtIndex:indexPath.row][@"email"];
    return cell;
}


@end
