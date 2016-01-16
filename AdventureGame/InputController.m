//
//  InputController.m
//  ContactList
//
//  Created by Carl Udren on 1/12/16.
//  Copyright © 2016 Carl Udren. All rights reserved.
//

#import "InputController.h"


@implementation InputController


-(NSString *)inputForPrompt:(NSString *)promptString{
    
    
    NSLog(@"%@", promptString);
    char userCommand[255];
    scanf("%s",userCommand);
    
    NSString *responseString = [NSString stringWithUTF8String:userCommand];
    return responseString;
}



@end
