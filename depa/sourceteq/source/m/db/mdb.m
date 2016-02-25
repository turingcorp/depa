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

+(NSNumber*)itemswith:(item_status)status
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