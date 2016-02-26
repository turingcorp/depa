#import "citem.h"

@implementation citem

-(instancetype)init:(NSString*)itemid title:(NSString*)title
{
    self = [super init];
    [self setTitle:title];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
#warning "analytics"
}

-(void)loadView
{
    self.view = [[vitem alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end