//
//  ViewController.h
//  LifeSearch
//
//  Created by qianfeng01 on 15-8-7.
//  Copyright (c) 2015年 zg. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "WeatherViewController.h"
#import "SimViewController.h"
#import "PostViewController.h"
#import "IPViewController.h"
#import "IdViewController.h"
#import "TrainTimeViewController.h"
#import "TrainTicketOutletsViewController.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *SegmentControl;


- (IBAction)selectAction:(UISegmentedControl *)sender;


@end

