//
//  WeatherDetailViewController.m
//  Weather
//
//  Created by Erdi on 8.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

#import "WeatherDetailViewController.h"
#import "Weather-Swift.h"
#import "WeatherDetailPresenterIO.h"

@interface WeatherDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@end

@implementation WeatherDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.presenter needDisplayItem];
}

- (void)updateDetailsWithDisplayInfo:(NSString *)displayInfo
{
    self.detailLabel.text = displayInfo;
}

@end
