#import "citem.h"

@implementation citem

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

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

#pragma mark public

-(void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end