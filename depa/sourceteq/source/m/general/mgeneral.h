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


typedef NS_ENUM(NSUInteger, item_status)
{
    item_status_none,
    item_status_favorite,
    item_status_nolike
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