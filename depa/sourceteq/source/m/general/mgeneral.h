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

// api

typedef NS_ENUM(NSUInteger, apicall)
{
    apicall_search
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