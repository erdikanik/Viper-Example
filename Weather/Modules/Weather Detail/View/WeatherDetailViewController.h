//
//  WeatherDetailViewController.h
//  Weather
//
//  Created by Erdi on 8.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeatherDetailPresenterIO.h"

@interface WeatherDetailViewController : UIViewController <WeatherDetailPresenterOutput>

@property (nonatomic, strong) id<WeatherDetailPresenterInput> presenter;

@end
