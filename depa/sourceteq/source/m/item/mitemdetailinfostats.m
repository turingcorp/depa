#import "mitemdetailinfostats.h"

@implementation mitemdetailinfostats

#pragma mark -
#pragma amrk detail info protocol

-(void)config:(mitemdetail*)item view:(vitem*)view
{
    self.items = [NSMutableArray array];
    
    if(item.meters)
    {
        NSString *meterstitle = [NSString stringWithFormat:NSLocalizedString(@"item_detail_stats_meters", nil), @(item.meters)];
        mitemdetailinfostatsmeters *meters = [[mitemdetailinfostatsmeters alloc] init];
        meters.title = meterstitle;
        
        [self.items addObject:meters];
    }
    
    if(item.rooms)
    {
        NSString *roomstitle = [NSString stringWithFormat:NSLocalizedString(@"item_detail_stats_rooms", nil), @(item.rooms)];
        mitemdetailinfostatsrooms *rooms = [[mitemdetailinfostatsrooms alloc] init];
        rooms.title = roomstitle;
        
        [self.items addObject:rooms];
    }
    
    if(item.baths)
    {
        NSString *bathstitle = [NSString stringWithFormat:NSLocalizedString(@"item_detail_stats_baths", nil), @(item.baths)];
        mitemdetailinfostatsbaths *baths = [[mitemdetailinfostatsbaths alloc] init];
        baths.title = bathstitle;
        
        [self.items addObject:baths];
    }
    
    if(item.garages)
    {
        NSString *garagetitle = [NSString stringWithFormat:NSLocalizedString(@"item_detail_stats_garages", nil), @(item.garages)];
        mitemdetailinfostatsgarages *garage = [[mitemdetailinfostatsgarages alloc] init];
        garage.title = garagetitle;
        
        [self.items addObject:garage];
    }
}

-(UIView*)overview
{
    vitemstats *view = [[vitemstats alloc] init:self];
    
    return view;
}

-(CGFloat)height
{
    return 70;
}

@end