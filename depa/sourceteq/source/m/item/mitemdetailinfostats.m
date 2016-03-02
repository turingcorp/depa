#import "mitemdetailinfostats.h"

@implementation mitemdetailinfostats
{
    NSMutableArray *array;
}

#pragma mark public

-(NSUInteger)count
{
    NSUInteger count = array.count;
    
    return count;
}

-(id<mitemdetailinfostatsprotocol>)item:(NSUInteger)index;
{
    id<mitemdetailinfostatsprotocol> item = array[index];
    
    return item;
}

#pragma mark -
#pragma amrk detail info protocol

-(void)config:(mitemdetail*)item collection:(UICollectionView*)collection
{
    array = [NSMutableArray array];
    
    if(item.meters)
    {
        NSString *meterstitle = [NSString stringWithFormat:NSLocalizedString(@"item_detail_stats_meters", nil), @(item.meters)];
        mitemdetailinfostatsmeters *meters = [[mitemdetailinfostatsmeters alloc] init];
        meters.title = meterstitle;
        
        [array addObject:meters];
    }
    
    if(item.rooms)
    {
        NSString *roomstitle = [NSString stringWithFormat:NSLocalizedString(@"item_detail_stats_rooms", nil), @(item.rooms)];
        mitemdetailinfostatsrooms *rooms = [[mitemdetailinfostatsrooms alloc] init];
        rooms.title = roomstitle;
        
        [array addObject:rooms];
    }
    
    if(item.garages)
    {
        NSString *garagetitle = [NSString stringWithFormat:NSLocalizedString(@"item_detail_stats_garages", nil), @(item.garages)];
        mitemdetailinfostatsgarages *garage = [[mitemdetailinfostatsgarages alloc] init];
        garage.title = garagetitle;
        
        [array addObject:garage];
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