#import "mitemdetailinfo.h"

@implementation mitemdetailinfo

-(instancetype)init:(vitem*)view
{
    self = [super init];
    self.view = view;
    
    return self;
}

#pragma mark public

-(void)loaditem:(mitemdetail*)item
{
    self.item = item;
    self.items = [NSMutableArray array];
    
    mitemdetailinfopaging *infopaging = [[mitemdetailinfopaging alloc] init];
    [infopaging config:item view:self.view];
    
    mitemdetailinfostats *infostats = [[mitemdetailinfostats alloc] init];
    [infostats config:item view:self.view];
    
    mitemdetailinfoaddress *infoaddress = [[mitemdetailinfoaddress alloc] init];
    [infoaddress config:item view:self.view];
    
    mitemdetailinfotitleprice *infotitleprice = [[mitemdetailinfotitleprice alloc] init];
    [infotitleprice config:item view:self.view];
    
    [self.items addObject:infopaging];
    [self.items addObject:infostats];
    [self.items addObject:infoaddress];
    [self.items addObject:infotitleprice];
}

-(void)adddescription
{
    mitemdetailinfodesc *infodesc = [[mitemdetailinfodesc alloc] init];
    [infodesc config:self.item view:self.view];
    
    [self.items addObject:infodesc];
}

@end