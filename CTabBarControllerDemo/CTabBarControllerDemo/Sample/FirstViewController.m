//
//  FirstViewController.m
//  CTabBarControllerDemo
//
//  Created by Ogan Topkaya on 08/11/14.
//  Copyright (c) 2014 Ogan Topkaya. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "CTabBarController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.layer.borderColor = [UIColor blueColor].CGColor;
    self.view.layer.borderWidth = 2.0f;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)push:(id)sender {
//    static NSInteger i = 0;
//    self.cTabBarItem.badge = [NSString stringWithFormat:@"%zd",i++];
    
    
    
    SecondViewController *detailVC = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    detailVC.hidesCTabBarWhenPushed = YES;
    [self.navigationController pushViewController:detailVC animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
