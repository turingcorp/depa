#import "citem.h"

@implementation citem

-(instancetype)init:(mitemdetail*)item
{
    self = [super init];
    
    self.item = item;
    [self createtitle];
    
    return self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    if(!self.manager)
    {
        amanager *manager = [amanager call:[[acallitem alloc] init:self.item.itemid] delegate:self];
        self.manager = manager;
    }
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
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

#pragma mark functionality

-(void)createtitle
{
    NSMutableString *displaytitle = [NSMutableString string];
    
    switch(self.item.type)
    {
        case search_type_house:
            
            [displaytitle appendString:NSLocalizedString(@"search_type_house", nil)];
            
            break;
            
        case search_type_apartment:
            
            [displaytitle appendString:NSLocalizedString(@"search_type_flat", nil)];
            
            break;
    }
    
    [displaytitle appendString:@" "];
    
    switch(self.item.mode)
    {
        case search_mode_rent:
            
            [displaytitle appendString:NSLocalizedString(@"search_mode_rent", nil)];
            
            break;
            
        case search_mode_buy:
            
            [displaytitle appendString:NSLocalizedString(@"search_mode_buy", nil)];
            
            break;
    }
    
    [self setTitle:displaytitle];
}

#pragma mark public

-(void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    
}

@end