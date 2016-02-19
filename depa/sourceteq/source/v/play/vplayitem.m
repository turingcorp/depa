#import "vplayitem.h"

@implementation vplayitem

-(instancetype)init
{
    self = [super init];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    
    UIImageView *image = [[UIImageView alloc] init];
    
    UILabel *label = [[UILabel alloc] init];
    
    return self;
}

@end