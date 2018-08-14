//
//  WeatherDetailPresenter.h
//  Weather
//
//  Created by Erdi on 8.04.2018.
//  Copyright © 2018 Erdi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherDetailPresenterIO.h"

@interface WeatherDetailPresenter: NSObject <WeatherDetailPresenterInput>

/**
 Main initializer

 @param displayItem Display item that holds information about weather details
 @return instance of self
 */
- (id)initWithDisplayItem:(WeatherDisplayItem *)displayItem;

/**
 Should be passed view controller conforms to WeatherDetailPresenterOutput
 */
@property (nonatomic, weak) id<WeatherDetailPresenterOutput> weatherDetailPresenterOutput;

@end
