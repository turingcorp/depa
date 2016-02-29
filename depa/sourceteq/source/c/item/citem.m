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
    [self tryagain];
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
    self.viewitem = (vitem*)self.view;
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

-(void)tryagain
{
    if(!self.manager)
    {
        amanager *manager = [amanager call:[[acallitem alloc] init:self.item.itemid] delegate:self];
        self.manager = manager;
    }
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    aparseritem *parser = (aparseritem*)manager.call.parser;
    [self.item.images add:parser.picturesarray];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [self.viewitem itemloaded];
                   });
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    [valert alert:error inview:self.viewitem];
    self.manager = nil;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self.viewitem errorloading];
                   });
}

@end