//
//  Player.h
//  AdventureGame
//
//  Created by Carl Udren on 1/13/16.
//  Copyright © 2016 Cory Alder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PathSegment.h"

@interface Player : NSObject

@property (nonatomic) PathSegment *currentPathSegment;
@property (nonatomic) NSInteger health;
@property (nonatomic) NSInteger wealth;
@property (nonatomic) NSInteger distanceTraveled;

-(instancetype)init;


@end
