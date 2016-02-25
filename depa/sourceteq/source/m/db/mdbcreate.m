#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE item (id INTEGER PRIMARY KEY, countryid TEXT COLLATE NOCASE, itemid TEXT COLLATE NOCASE, status INTEGER);";
    
    [dbcon query:query];
    [dbcon commit];
}

@end