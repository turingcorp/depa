#import "vlikedbutton.h"

@implementation vlikedbutton

-(instancetype)init:(cpages*)pages
{
    self = [super initWithImage:[UIImage imageNamed:@"liked"] style:UIBarButtonItemStylePlain target:pages action:@selector(openfavorites)];
    self.imageInsets = UIEdgeInsetsMake(0, -14, 0, 14);
    
    return self;
}

@end