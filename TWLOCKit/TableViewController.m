//
//  TableViewController.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2020/5/7.
//  Copyright © 2020 唐万龙. All rights reserved.
//

#import "TableViewController.h"



@interface TableViewController () {
    NSDictionary *VC_CONF_DICT;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
   VC_CONF_DICT = @{
           @"String" : @"StringController",
           @"Buttons" : @"ButtonsController",
           @"ImageViews" : @"ImageViewsController",
           @"Fields" : @"FieldController",
           @"TextView" : @"TextViewController",
           @"Player" : @"PlayerController",
           @"Security" : @"SecurityController",
           @"Alert" : @"AlertViewController",
           @"AlertView" : @"AlertController"
       };
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return VC_CONF_DICT.allKeys.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = VC_CONF_DICT.allKeys[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *key = VC_CONF_DICT.allKeys[indexPath.row];
    NSString *vcName = VC_CONF_DICT[key];
    UIViewController *VC = [[NSClassFromString(vcName) alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

@end
