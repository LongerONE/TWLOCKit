//
//  ImagesListVC.m
//  TWLOCKit
//
//  Created by 唐万龙 on 2023/5/4.
//  Copyright © 2023 唐万龙. All rights reserved.
//

#import "ImagesListVC.h"
#import "ImagesCell.h"

@interface ImagesListVC ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray<NSString *> *imgsArray;


@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ImagesListVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ImagesCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    self.imgsArray = @[
        @"https://images.pexels.com/photos/16117986/pexels-photo-16117986.jpeg",
        @"https://images.pexels.com/photos/14454925/pexels-photo-14454925.jpeg",
        @"https://images.pexels.com/photos/15302393/pexels-photo-15302393.jpeg",
        @"https://images.pexels.com/photos/15413559/pexels-photo-15413559.jpeg",
        @"https://images.pexels.com/photos/13444728/pexels-photo-13444728.jpeg",
        @"https://images.pexels.com/photos/16117986/pexels-photo-16117986.jpeg",
        @"https://images.pexels.com/photos/14454925/pexels-photo-14454925.jpeg",
        @"https://images.pexels.com/photos/15302393/pexels-photo-15302393.jpeg",
        @"https://images.pexels.com/photos/15413559/pexels-photo-15413559.jpeg",
        @"https://images.pexels.com/photos/13444728/pexels-photo-13444728.jpeg",
        @"https://images.pexels.com/photos/16117986/pexels-photo-16117986.jpeg",
        @"https://images.pexels.com/photos/14454925/pexels-photo-14454925.jpeg",
        @"https://images.pexels.com/photos/15302393/pexels-photo-15302393.jpeg",
        @"https://images.pexels.com/photos/15413559/pexels-photo-15413559.jpeg",
        @"https://images.pexels.com/photos/13444728/pexels-photo-13444728.jpeg",
        @"https://images.pexels.com/photos/16117986/pexels-photo-16117986.jpeg",
        @"https://images.pexels.com/photos/14454925/pexels-photo-14454925.jpeg",
        @"https://images.pexels.com/photos/15302393/pexels-photo-15302393.jpeg",
        @"https://images.pexels.com/photos/15413559/pexels-photo-15413559.jpeg",
        @"https://images.pexels.com/photos/13444728/pexels-photo-13444728.jpeg",        @"https://images.pexels.com/photos/16117986/pexels-photo-16117986.jpeg",
        @"https://images.pexels.com/photos/14454925/pexels-photo-14454925.jpeg",
        @"https://images.pexels.com/photos/15302393/pexels-photo-15302393.jpeg",
        @"https://images.pexels.com/photos/15413559/pexels-photo-15413559.jpeg",
        @"https://images.pexels.com/photos/13444728/pexels-photo-13444728.jpeg",
    ];
    [self.tableView reloadData];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.imgsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ImagesCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.imgView.imgUrl = self.imgsArray[indexPath.row];
    
    return cell;
}


@end
