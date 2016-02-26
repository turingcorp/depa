#import "citem.h"

@implementation citem

-(instancetype)init:(NSString*)itemid mode:(search_mode)mode
{
    self = [super init];
    
    NSString *displaytitle;
    
    switch(mode)
    {
        case search_mode_rent:
            
            displaytitle = NSLocalizedString(@"search_mode_rent", nil);
            
            break;
            
        case search_mode_buy:
            
            displaytitle = NSLocalizedString(@"search_mode_buy", nil);
            
            break;
    }
    
    [self setTitle:displaytitle];
    
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