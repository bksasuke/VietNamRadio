//
//  MainViewController.m
//  SidebarDemo
//
//  Created by Simon Ng on 10/11/14.
//  Copyright (c) 2014 AppCoda. All rights reserved.
//

#import "MainViewController.h"
#import "SWRevealViewController.h"
#import "SidebarTableViewController.h"
#import "Poster.h"
#import "CustomCell.h"
@interface MainViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

{
     NSMutableArray *arrayData;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"VietNam Radio";

    SWRevealViewController *revealViewController = self.revealViewController;
    if ( revealViewController )
    {
        [self.sidebarButton setTarget: self.revealViewController];
        [self.sidebarButton setAction: @selector( revealToggle: )];
        [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    }
    
    CGFloat statusNavigationBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.bounds.size.height;
    CGRect tableViewRec = CGRectMake(0,statusNavigationBarHeight, self.view.bounds.size.width, self.view.bounds.size.height);
    
    Poster *data1 = [[Poster alloc] initWithTitle:@"Zing Radio " withImagePath:@"zing.jpg" andScore:6.3];
    Poster *data2 = [[Poster alloc] initWithTitle:@"Xone FM" withImagePath:@"xonefm.jpeg" andScore:5];
    Poster *data3 = [[Poster alloc] initWithTitle:@"Quick& Snow\n Show" withImagePath:@"quickandsnow.jpg" andScore:8];
    Poster *data4 = [[Poster alloc] initWithTitle:@"VoV Giao thông" withImagePath:@"vov1.jpg" andScore:7.4];
    Poster *data5 = [[Poster alloc] initWithTitle:@"The Voice" withImagePath:@"zing2.png" andScore:9];
    
    arrayData = [[NSMutableArray alloc] initWithObjects:data1, data2, data3, data4, data5, nil];
    
    
    
    self.tableView = [[UITableView alloc]initWithFrame:tableViewRec
                                                   style:UITableViewStylePlain];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.view addSubview:_tableView];
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayData.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"CustomCell";
    
    CustomCell *cell = (CustomCell*)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:cellIdentifier
                                                     owner:nil
                                                   options:nil];
        cell = (CustomCell*)[nib objectAtIndex:0];
    }
    
    Poster *data = [[Poster alloc] init];
    data = arrayData[indexPath.row];
    cell.labelTitle.text = data.title;
    cell.labelScore.text = [NSString stringWithFormat:@"%.1f", data.score];
    cell.imgThumb.image = data.image;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}



@end
