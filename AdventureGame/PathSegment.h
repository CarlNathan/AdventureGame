//
//  PathSegment.h
//  AdventureGame

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, PathSegmentContent){
    treasure,
    health,
    creature,
};

@interface PathSegment : NSObject

@property (nonatomic, assign) PathSegmentContent content;
@property (nonatomic, strong) PathSegment *mainRoad;
@property (nonatomic, strong) PathSegment *sideBranch;

+ (instancetype)segmentWithContent;

@end
