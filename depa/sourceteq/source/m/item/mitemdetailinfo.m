#import "mitemdetailinfo.h"

@implementation mitemdetailinfo

-(instancetype)init:(UICollectionView*)collection
{
    self = [super init];
    self.collection = collection;
    
    return self;
}

#pragma mark public

-(void)loaditem:(mitemdetail*)item
{
    self.items = [NSMutableArray array];
    
    mitemdetailinfostats *infostats = [[mitemdetailinfostats alloc] init];
    [infostats config:self.item collection:self.view.collection];
    
    mitemdetailinfoaddress *infoaddress = [[mitemdetailinfoaddress alloc] init];
    [infoaddress config:self.item collection:self.view.collection];
    
    mitemdetailinfotitleprice *infotitleprice = [[mitemdetailinfotitleprice alloc] init];
    [infotitleprice config:self.item collection:self.view.collection];
    
    [self.view.model add:infostats];
    [self.view.model add:infoaddress];
    [self.view.model add:infotitleprice];
}

-(void)adddescription
{
    mitemdetailinfodesc *infodesc = [[mitemdetailinfodesc alloc] init];
    [infodesc config:self.item collection:self.view.collection];
}

@end