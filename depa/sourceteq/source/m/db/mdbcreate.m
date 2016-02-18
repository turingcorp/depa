#import "mdbcreate.h"

@implementation mdbcreate

+(void)create
{
    NSString *query;
    db *dbcon = [db begin];
    
    query = @"CREATE TABLE flows (id INTEGER PRIMARY KEY, created INTEGER, path TEXT);";
    
    [dbcon query:query];
    [dbcon commit];
}

@end