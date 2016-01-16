//
//  GameController.h
//  AdventureGame


#import <Foundation/Foundation.h>
#import "PathSegment.h"
#import "Player.h"

typedef NS_ENUM(NSInteger, MovementDirection) {
    MovementDirectionMain,
    MovementDirectionSide
};

@interface GameController : NSObject

@property (nonatomic, strong) PathSegment *start;
@property (nonatomic, strong) Player *player;

-(void)printPath;

- (void) playerStatus;

- (void) prompForMove;

- (NSInteger) getWealth;

- (NSInteger) getHealth;

- (NSInteger) getDistanceTraveled;



@end
