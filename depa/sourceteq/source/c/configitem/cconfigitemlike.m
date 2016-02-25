#import "cconfigitemlike.h"

@implementation cconfigitemlike

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"config_item_like_title", nil)];
}

-(void)loadView
{
    self.view = [[vconfigitemlike alloc] init:self];
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