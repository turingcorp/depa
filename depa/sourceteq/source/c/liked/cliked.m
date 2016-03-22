#import "cliked.h"

@implementation cliked

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:NSLocalizedString(@"liked_title", nil)];
    
    [mdb clearviewed];
    [[NSNotificationCenter defaultCenter] postNotificationName:notbadgechange object:nil];
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [(vliked*)self.view unselect];
    
    [[analytics singleton] trackscreen:ga_screen_liked];
}

-(void)loadView
{
    self.view = [[vliked alloc] init:self];
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