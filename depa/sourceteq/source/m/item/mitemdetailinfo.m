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
    self.item = item;
    self.items = [NSMutableArray array];
    
    mitemdetailinfostats *infostats = [[mitemdetailinfostats alloc] init];
    [infostats config:item collection:self.collection];
    
    mitemdetailinfoaddress *infoaddress = [[mitemdetailinfoaddress alloc] init];
    [infoaddress config:item collection:self.collection];
    
    mitemdetailinfotitleprice *infotitleprice = [[mitemdetailinfotitleprice alloc] init];
    [infotitleprice config:item collection:self.collection];
    
    [self.items addObject:infostats];
    [self.items addObject:infoaddress];
    [self.items addObject:infotitleprice];
}

-(void)adddescription
{
    mitemdetailinfodesc *infodesc = [[mitemdetailinfodesc alloc] init];
    [infodesc config:self.item collection:self.collection];
    
    [self.items addObject:infodesc];
}

@end