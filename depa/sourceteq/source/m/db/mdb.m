#import "mdb.h"

@implementation mdb

+(void)updatedb
{
    NSUserDefaults *userdef = [NSUserDefaults standardUserDefaults];
    NSDictionary *def = [tools defaultdict];
    
    NSString *dbfoldername = @"db";
    NSString *defdbname = def[@"dbname"];
    NSString *relative = [dbfoldername stringByAppendingPathComponent:defdbname];
    NSString *dbfolder = [documents stringByAppendingPathComponent:dbfoldername];
    [userdef setValue:relative forKey:@"dbname"];
    
    NSString *originaldb = [[NSBundle mainBundle] pathForResource:defdbname ofType:@""];
    dbname = [documents stringByAppendingPathComponent:relative];
    [mdirs createdir:[NSURL fileURLWithPath:dbfolder]];
    [mdirs copyfilefrom:originaldb to:dbname];
    
    [mdbcreate create];
}

+(NSUInteger)add:(mdbitem*)item
{
    NSUInteger now = [NSDate date].timeIntervalSince1970;
    NSInteger intlatitude = item.latitude * coorddelta;
    NSInteger intlongitude = item.longitude * coorddelta;
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO item "
                       "(created, countryid, itemid, status, thumbnail, title, currency, price, "
                       "meters, rooms, parking, phone, email, latitude, longitude, "
                       "searchmode, searchtype) "
                       "VALUES(%@, \"%@\", \"%@\", %@, \"%@\", \"%@\", \"%@\", %@, "
                       "%@, %@, %@, \"%@\", \"%@\", %@, %@, "
                       "%@, %@);",
                       @(now), item.countryid, item.itemid, @(item.status), item.thumbnail, item.title, item.currency, item.price,
                       item.meters, item.rooms, item.parking, item.phone, item.email, @(intlatitude), @(intlongitude),
                       @(item.mode), @(item.type)];

    NSUInteger dbid = [db query_identity:query];
    
    return dbid;
}

+(NSArray*)itemsfor:(item_status)status
{
    NSMutableArray *array = [NSMutableArray array];
    
    
    
    return array;
}

+(NSNumber*)itemsfor:(item_status)status
{
    NSString *query = [NSString stringWithFormat:
                       @"SELECT COUNT(id) FROM item WHERE status=%@;",
                       @(status)];
    NSNumber *value = [db value:query];
    
    return value;
}

+(void)clear:(item_status)status
{
    NSString *query = [NSString stringWithFormat:
                       @"DELETE FROM item WHERE status=%@;",
                       @(status)];
    [db query:query];
    [[mitem singleton] insideload];
}

@end