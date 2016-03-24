#import "citem.h"

typedef NS_ENUM(NSUInteger, item_loaded)
{
    item_loaded_none,
    item_loaded_info,
    item_loaded_descr
};

@interface citem ()

@property(strong, nonatomic)vitem *view;

@end

@implementation citem
{
    item_loaded loaded;
}

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
    loaded = item_loaded_none;
    
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

#pragma mark functionality

-(void)loaditem
{
    self.manager = [amanager call:[[acallitem alloc] init:self.item.itemid] delegate:self];
}

-(void)loaddescr
{
    self.manager = [amanager call:[[acalldesc alloc] init:self.item.itemid] delegate:self];
}

#pragma mark public

-(void)back
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void)tryagain
{
    [self.manager cancelcall];
    
    switch(loaded)
    {
        case item_loaded_none:
            
            [self loaditem];
            
            break;
            
        case item_loaded_info:
            
            [self loaddescr];
            
            break;
            
        case item_loaded_descr:
            break;
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
                           loaded = item_loaded_info;
                           [self.view itemloaded];
                           [self loaddescr];
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
                           loaded = item_loaded_descr;
                           [self.view descriptionloaded];
                       });
    }
}

-(void)call:(amanager*)manager error:(NSString*)error
{
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