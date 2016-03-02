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
    search_order_higher,
    search_order_relevance
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
    ga_screen_play,
    ga_screen_liked,
    ga_screen_detail,
    ga_screen_detail_contact,
    ga_screen_detail_location,
    ga_screen_config,
    ga_screen_config_location,
    ga_screen_config_likes,
    ga_screen_config_discarded
};

typedef NS_ENUM(NSUInteger, ga_event)
{
    ga_event_play,
    ga_event_location,
    ga_event_clear,
    ga_event_call,
    ga_event_viewmore
};

typedef NS_ENUM(NSUInteger, ga_action)
{
    ga_action_like,
    ga_action_no,
    ga_action_map,
    ga_action_list,
    ga_action_optin
};