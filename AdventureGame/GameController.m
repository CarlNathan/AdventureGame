//
//  GameController.m
//  AdventureGame


#import "GameController.h"
#import "InputController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        // generate game path
        
        _start = [self generatePath];
        Player *player = [[Player alloc] init];
        player.currentPathSegment = _start;
        _player = player;
    }
    return self;
}

-(PathSegment *)generatePath {
    
    PathSegment *home = [PathSegment segmentWithContent];
    
    PathSegment *mainBranchCursor = home; // primary
    PathSegment *sideBranchCursor = nil;
    
    for (int i = 0; i < 100; i++) {
                
        if (mainBranchCursor != nil) {
            // append to main branch
            mainBranchCursor.mainRoad = [PathSegment segmentWithContent];
            mainBranchCursor = mainBranchCursor.mainRoad;
        }
        
        if (sideBranchCursor != nil) {
            // append to side branch
            sideBranchCursor.sideBranch = [PathSegment segmentWithContent];
            sideBranchCursor = sideBranchCursor.sideBranch;
        }
        
        if (mainBranchCursor && sideBranchCursor) {
            // if we're branched right now, maybe merge.
            if (arc4random_uniform(10) < 3) {
                sideBranchCursor.mainRoad = mainBranchCursor;
                sideBranchCursor = nil;
            }
        } else {
            // if we're not branched right now, maybe split.
            if (arc4random_uniform(10) < 3) {
                sideBranchCursor = mainBranchCursor;
            }
        }
    }
    
    return home;
}


-(PathSegmentContent *)randomContent {
    return nil;
}


-(void)printPath {
    
    PathSegment *mainPath = self.start.mainRoad;
    PathSegment *sidePath = self.start.sideBranch;
    
    while (mainPath.mainRoad != NULL) {
        [self printMainPath:mainPath andSide:sidePath];
        
        printf("\n");
        mainPath = mainPath.mainRoad;
        
        if (mainPath.sideBranch) {
            sidePath = mainPath.sideBranch;
        } else if (sidePath) {
            sidePath = sidePath.sideBranch;
        }
    }
}


-(void)printMainPath:(PathSegment *)main andSide:(PathSegment *)side {
    if (!main) return;
    
    if (main.mainRoad && main.sideBranch) {
        printf("|\\");
    } else {
        if (main.mainRoad) {
            printf("|");
        }
        
        if (side) {
            if (side.sideBranch) {
                printf(" |");
            } else {
                printf("/");
            }
        }
    }
}

- (void) playerStatus{
    NSInteger distanceTraveled = self.player.distanceTraveled;
    NSInteger health = self.player.health;
    NSInteger wealth = self.player.wealth;
    PathSegment *nextMainPath = self.player.currentPathSegment.mainRoad;
    PathSegment *nextBranch = self.player.currentPathSegment.sideBranch;
    
    NSLog(@"*************************************************************\n Health: %ld -- Wealth: %ld.  \n You have traveled %ld long path segments.", health, wealth, distanceTraveled);
    if (nextMainPath != nil && nextBranch != nil) {
        NSLog(@"You can go staight along the main path or take the branching path!");
    } else if (nextMainPath == nil){
        NSLog(@"You can continue down the branch!");
    } else if (nextBranch == nil) {
        NSLog(@"You can move forward on the main path!");
        }
    
    
}

- (void) prompForMove{
    InputController *input = [InputController new];
    NSString *inputString = [input inputForPrompt:@"Where would you like to move?  Main path or side branch?"];
    if ([inputString.lowercaseString isEqualToString:@"main path"] || [inputString.lowercaseString isEqualToString: @"main"]) {
        [self movePlayerMain];
    } else if ([inputString.lowercaseString isEqualToString:@"side branch"] || [inputString.lowercaseString isEqualToString: @"side"] || [inputString.lowercaseString isEqualToString: @"branch"]) {
        [self movePlayerSide];
    } else {
        NSLog(@"Cannot move that direction");
    }
}


- (void) movePlayerMain{
    self.player.currentPathSegment = self.player.currentPathSegment.mainRoad;
    self.player.distanceTraveled++;
        switch (self.player.currentPathSegment.content) {
            case treasure:
                self.player.wealth = self.player.wealth + 10;
                [self eventLogSeparator];
                NSLog(@"You found some money on a path!  What were the chances? Wealth + 10");
                break;
                
            case creature:
                self.player.health = self.player.health - 12;
                [self eventLogSeparator];
                NSLog(@"TERRIFYING CREATURE ATTACKS!!! Health - 12.");
                break;
                
            case health:
                self.player.health = self.player.health + 10;
                [self eventLogSeparator];
                NSLog(@"You found some magic mushrooms.  Whoa man.  Health + 10");
                break;
                
            default:
                break;
        }
    }


- (void) movePlayerSide{
    self.player.currentPathSegment = self.player.currentPathSegment.sideBranch;
    self.player.distanceTraveled++;
        switch (self.player.currentPathSegment.content) {
            case treasure:
                self.player.wealth = self.player.wealth + 10;
                [self eventLogSeparator];
                NSLog(@"You found some money on a path!  What were the chances? Wealth + 10");
                break;
                
            case creature:
                self.player.health = self.player.health - 12;
                [self eventLogSeparator];
                NSLog(@"TERRIFYING CREATURE ATTACKS!!! Health - 12.");
                break;
                
            case health:
                self.player.health = self.player.health + 10;
                [self eventLogSeparator];
                NSLog(@"You found some magic mushrooms.  Whoa man.  Health + 10");
                break;
                
            default:
                break;
    }
}



- (NSInteger) getWealth{
    return self.player.wealth;
}

- (NSInteger) getHealth{
    return self.player.health;
}

- (NSInteger) getDistanceTraveled{
    return self.player.distanceTraveled;
}

- (void) eventLogSeparator{
    NSLog(@"************************************************************************");
}

@end
