#import "citem.h"

@interface citem ()

@property(strong, nonatomic)vitem *view;

@end

@implementation citem

@dynamic view;

+(void)show:(mitemdetail*)item
{
    citem *controller = [[citem alloc] init:item];
    [[cmain singleton] pushViewController:controller animated:YES];
}

-(instancetype)init:(mitemdetail*)item
{
    self = [super init];
    
    self.item = item;
    
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
        [self.view.model loaditem:self.item];
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self.view itemloaded];
                           
                           amanager *manager = [amanager call:[[acalldesc alloc] init:self.item.itemid] delegate:self];
                           self.manager = manager;
                       });
    }
    else
    {
        aparserdesc *parser = (aparserdesc*)manager.call.parser;
        self.item.itemdesc = parser.itemdesc;
        [self.view.model adddescription];
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self.view descriptionloaded];
                       });
    }
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    self.manager = nil;
    
    if([manager.call isKindOfClass:[acallitem class]])
    {
        [valert alert:error inview:self.view offsettop:65];
        
        dispatch_async(dispatch_get_main_queue(),
                       ^
                       {
                           [self.view errorloading];
                       });
    }
}

@end