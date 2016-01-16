//
//  PathSegment.m
//  AdventureGame


#import "PathSegment.h"

@implementation PathSegment

+ (PathSegmentContent)generateContent{
    int r = arc4random_uniform(9);
    PathSegmentContent content;
    if (r > 5 ) {
        content = treasure;
    }
    else if (r ==1) {
        content = creature;
    }
    else if (r == 3) {
        content = health;
    } else {
        return content;
    }
    return content;
}

+ (instancetype)segmentWithContent{
    PathSegment *path = [[PathSegment alloc] init];
    path.content = [PathSegment generateContent];
    return path;
}

@end
