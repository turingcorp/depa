#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE item (id INTEGER PRIMARY KEY, created INTEGER, countryid TEXT COLLATE NOCASE, itemid TEXT COLLATE NOCASE, status INTEGER, thumbnail TEXT, title TEXT COLLATE NOCASE, currency TEXT, price INTEGER, rooms INTEGER, parking INTEGER, phone TEXT, email TEXT, latitude INTEGER, longitude INTEGER);";
    
    [dbcon query:query];
    [dbcon commit];
}

@end