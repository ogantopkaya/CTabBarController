//
//  SecondViewController.m
//  CTabBarControllerDemo
//
//  Created by Ogan Topkaya on 08/11/14.
//  Copyright (c) 2014 Ogan Topkaya. All rights reserved.
//

#import "SecondViewController.h"
#import "FirstViewController.h"

#import "CTabBarController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.borderColor = [UIColor blackColor].CGColor;
    self.view.layer.borderWidth = 2.0f;
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)push:(id)sender {
    FirstViewController *detailVC = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
//    detailVC.hidesCTabBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
