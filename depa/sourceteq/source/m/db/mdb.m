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

+(NSUInteger)add:(NSString*)itemid country:(NSString*)countryid status:(item_status)status thumbnail:(NSString*)thumbnail title:(NSString*)title currency:(NSString*)currency price:(NSNumber*)price rooms:(NSNumber*)rooms parking:(NSNumber*)parking phone:(NSString*)phone email:(NSString*)email latitude:(double)latitude longitude:(double)longitude
{
    mitemitem *item;
    NSUInteger now = [NSDate date].timeIntervalSince1970;
    NSInteger intlatitude = latitude * coorddelta;
    NSInteger intlongitude = longitude * coorddelta;
    NSString *query = [NSString stringWithFormat:
                       @"INSERT INTO item "
                       "(created, countryid, itemid, status, thumbnail, title, currency, price, "
                       "rooms, parking, phone, email, latitude, longitude) "
                       "VALUES(%@, \"%@\", \"%@\", %@, \"%@\", \"%@\", %@, %@, "
                       "%@, %@, \"%@\", \"%@\", %@, %@);",
                       @(now), countryid, itemid, @(status), thumbnail, title, currency, price,
                       rooms, parking, phone, email, @(intlatitude), @(intlongitude)];
    
    NSUInteger dbid = [db query_identity:query];
    
    return dbid;
}

+(NSNumber*)itemswitch:(item_status)status
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