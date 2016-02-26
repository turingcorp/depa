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

+(NSArray*)allitemsfor:(item_status)status
{
    NSMutableArray *array = [NSMutableArray array];
    NSString *query = [NSString stringWithFormat:
                       @"SELECT id, created, countryid, itemid, status, thumbnail, "
                       "title, currency, price, meters, rooms, parking, "
                       "phone, email, latitude, longitude, searchmode, "
                       "searchtype "
                       "FROM item "
                       "WHERE status=%@ "
                       "ORDER BY created ASC;",
                       @(status)];
    NSArray *rawarray = [db rows:query];
    NSUInteger count = rawarray.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        mdbitem *dbitem = [[mdbitem alloc] init];
        NSDictionary *rawitem = rawarray[i];
        NSString *rawitemid = rawitem[@"itemid"];
        NSString *rawcountryid = rawitem[@"countryid"];
        NSString *rawthumb = rawitem[@"thumbnail"];
        NSString *rawtitle = rawitem[@"title"];
        NSString *rawcurrency = rawitem[@"currency"];
        NSString *rawphone = rawitem[@"phone"];
        NSString *rawemail = rawitem[@"email"];
        NSNumber *rawdbid = rawitem[@"id"];
        NSNumber *rawprice = rawitem[@"price"];
        NSNumber *rawmeters = rawitem[@"meters"];
        NSNumber *rawrooms = rawitem[@"rooms"];
        NSNumber *rawparking = rawitem[@"parking"];
        item_status rawstatus = (item_status)[rawitem[@"status"] unsignedIntegerValue];
        search_mode rawmode = (search_mode)[rawitem[@"searchmode"] unsignedIntegerValue];
        search_type rawtype = (search_type)[rawitem[@"searchtype"] unsignedIntegerValue];
        double rawlatitude = [rawitem[@"latitude"] integerValue] / coorddelta;
        double rawlongitude = [rawitem[@"longitude"] integerValue] / coorddelta;
        NSUInteger rawcreated = [rawitem[@"created"] unsignedIntegerValue];
        
        dbitem.dbid = rawdbid;
        dbitem.created = rawcreated;
        dbitem.countryid = rawcountryid;
        dbitem.itemid = rawitemid;
        dbitem.status = rawstatus;
        dbitem.thumbnail = rawthumb;
        dbitem.title = rawtitle;
        dbitem.currency = rawcurrency;
        dbitem.price = rawprice;
        dbitem.meters = rawmeters;
        dbitem.rooms = rawrooms;
        dbitem.parking = rawparking;
        dbitem.phone = rawphone;
        dbitem.email = rawemail;
        dbitem.latitude = rawlatitude;
        dbitem.longitude = rawlongitude;
        dbitem.mode = rawmode;
        dbitem.type = rawtype;
        
        [array addObject:dbitem];
    }
    
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