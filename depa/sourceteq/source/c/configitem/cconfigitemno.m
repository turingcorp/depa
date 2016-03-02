#import "cconfigitemno.h"

@implementation cconfigitemno

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"config_item_no_title", nil)];
    
    [[analytics singleton] trackscreen:ga_screen_config_discarded];
}

-(void)loadView
{
    self.view = [[vconfigitemno alloc] init:self];
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