#import "appdel.h"
#import "mconfigmodprotocol.h"
#import "mconfigtypprotocol.h"

@class mcountryitem;

@interface msettings:NSObject

+(instancetype)singleton;
-(void)save;
-(void)changecountry:(mcountryitem*)country location:(NSString*)location locationname:(NSString*)locationname;

@property(strong, nonatomic)id<mconfigmodprotocol> searchmode;
@property(strong, nonatomic)id<mconfigtypprotocol> searchtype;
@property(copy, nonatomic)NSString *location;
@property(copy, nonatomic)NSString *locationname;
@property(weak, nonatomic)mcountryitem *country;

@end