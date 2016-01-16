//
//  main.m
//  AdventureGame

#import <Foundation/Foundation.h>
#import "GameController.h"
#import "InputController.h"

int main(int argc, const char * argv[]) {
    
        
        GameController *game = [[GameController alloc] init];
    
        [game printPath];
         
         NSLog(@"Welcome to the path!");
         
         while (YES) {
             [game playerStatus];
             [game prompForMove];
             
        
        
    }
    return 0;
}
