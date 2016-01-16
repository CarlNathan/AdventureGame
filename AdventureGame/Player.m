//
//  Player.m
//  AdventureGame
//
//  Created by Carl Udren on 1/13/16.
//  Copyright © 2016 Cory Alder. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype)init{
    self = [super init];
    if (self) {
        _health = 100;

    }
    return self;
}

@end
