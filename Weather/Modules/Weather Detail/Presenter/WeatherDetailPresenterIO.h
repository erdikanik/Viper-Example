//
//  WeatherDetailPresenterIO.h
//  Weather
//
//  Created by Erdi on 8.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WeatherDisplayItem;

@protocol WeatherDetailPresenterInput <NSObject>
   - (void)needDisplayItem;
@end

@protocol WeatherDetailPresenterOutput <NSObject>
    - (void)updateDetailsWithDisplayInfo:(NSString *)displayInfo;
@end

