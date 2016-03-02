#import "citem.h"

@implementation citem

+(void)show:(mitemdetail*)item
{
    citem *controller = [[citem alloc] init:item];
    [[cmain singleton] pushViewController:controller animated:YES];
}

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
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    [[analytics singleton] trackscreen:ga_screen_detail];
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
    
    self.item.displaytitle = displaytitle;
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

-(void)contact
{
    [citemcontact show:self.item];
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    if([manager.call isKindOfClass:[acallitem class]])
    {
        aparseritem *parser = (aparseritem*)manager.call.parser;
        [self.item.images add:parser.picturesarray];
        self.item.itemtitle = parser.itemtitle;
        self.item.permalink = parser.itempermalink;
        self.item.itemaddress = parser.itemaddress;
        self.item.latitude = parser.latitude;
        self.item.longitude = parser.longitude;
        self.item.meters = parser.meters;
        self.item.rooms = parser.rooms;
        self.item.garages = parser.garages;
        self.item.itemprice = [[tools singleton] pricetostring:parser.itemprice currency:parser.itemcurrency];
        
        mitemdetailinfostats *infostats = [[mitemdetailinfostats alloc] init];
        [infostats config:self.item collection:self.viewitem.collection];
        
        mitemdetailinfoaddress *infoaddress = [[mitemdetailinfoaddress alloc] init];
        [infoaddress config:self.item collection:self.viewitem.collection];
        
        mitemdetailinfotitleprice *infotitleprice = [[mitemdetailinfotitleprice alloc] init];
        [infotitleprice config:self.item collection:self.viewitem.collection];
        
        [self.viewitem.model add:infostats];
        [self.viewitem.model add:infoaddress];
        [self.viewitem.model add:infotitleprice];
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self.viewitem itemloaded];
                           
                           amanager *manager = [amanager call:[[acalldesc alloc] init:self.item.itemid] delegate:self];
                           self.manager = manager;
                       });
    }
    else
    {
        aparserdesc *parser = (aparserdesc*)manager.call.parser;
        self.item.itemdesc = parser.itemdesc;
        
        mitemdetailinfodesc *infodesc = [[mitemdetailinfodesc alloc] init];
        [infodesc config:self.item collection:self.viewitem.collection];
        
        [self.viewitem.model add:infodesc];
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self.viewitem descriptionloaded];
                       });
    }
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    self.manager = nil;
    
    if([manager.call isKindOfClass:[acallitem class]])
    {
        [valert alert:error inview:self.viewitem offsettop:65];
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self.viewitem errorloading];
                       });
    }
}

@end