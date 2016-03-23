#import "mitemdetailimg.h"

@implementation mitemdetailimg

-(instancetype)init
{
    self = [super init];
    
    self.items = [NSMutableArray array];
    
    return self;
}

#pragma mark public
-(void)add:(NSArray*)urls
{
    NSUInteger count = urls.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSString *url = urls[i];
        aimateqitem *image = [[aimateqitem alloc] init:url];
        [self.items addObject:image];
    }
}

@end