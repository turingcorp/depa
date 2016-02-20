#import "vplayitemheader.h"

@implementation vplayitemheader

-(instancetype)init:(msearchresult*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    
    return self;
}

@end