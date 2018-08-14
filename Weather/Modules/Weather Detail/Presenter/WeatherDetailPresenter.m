//
//  WeatherDetailPresenter.m
//  Weather
//
//  Created by Erdi on 8.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

#import "WeatherDetailPresenter.h"
#import "Weather-Swift.h"

@interface WeatherDetailPresenter()

@property (nonatomic, strong) WeatherDisplayItem *displayItem;

@end

@implementation WeatherDetailPresenter

- (id)initWithDisplayItem:(WeatherDisplayItem *)displayItem {
    self = [super init];
    
    if (self)
    {
        _displayItem = displayItem;
    }
    
    return self;
}

#pragma mark - WeatherDetailPresenterInput
- (void)needDisplayItem {
    NSString *displayString = [self.displayItem detailDisplayData];
    [self.weatherDetailPresenterOutput updateDetailsWithDisplayInfo:displayString];
}

@end
