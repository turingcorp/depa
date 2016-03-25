#import "mconfigloc.h"

@implementation mconfigloc
{
    NSArray *array;
}

-(instancetype)init
{
    self = [super init];

    self.selected = 0;
    array = @[
              [[mconfiglocmap alloc] init],
              [[mconfigloclist alloc] init]
              ];
    
    return self;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(id<mconfiglocprotocol>)item:(NSUInteger)index
{
    id<mconfiglocprotocol> item = array[index];
    
    return item;
}

-(id<mconfiglocprotocol>)itemselected
{
    return [self item:self.selected];
}

-(void)changeselected:(NSUInteger)index
{
    self.selected = index;
}

@end