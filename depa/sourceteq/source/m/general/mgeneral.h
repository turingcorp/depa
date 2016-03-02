#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, search_mode)
{
    search_mode_rent,
    search_mode_buy
};

typedef NS_ENUM(NSUInteger, search_type)
{
    search_type_house,
    search_type_apartment
};

typedef NS_ENUM(NSUInteger, search_order)
{
    search_order_lower,
    search_order_higher
};

typedef NS_ENUM(NSUInteger, search_attr)
{
    search_attr_unknown,
    search_attr_mtrs,
    search_attr_rooms,
    search_attr_garage
};

typedef NS_ENUM(NSUInteger, item_status)
{
    item_status_none,
    item_status_like,
    item_status_no
};

// analytics

typedef NS_ENUM(NSUInteger, ga_screen)
{
    ga_screen_list,
};

typedef NS_ENUM(NSUInteger, ga_event)
{
    ga_event_export
};

typedef NS_ENUM(NSUInteger, ga_action)
{
    ga_action_done
};