#import "appdel.h"
#import "mconfigmodprotocol.h"
#import "mconfigtypprotocol.h"
#import "mconfigsorprotocol.h"

@class mcountryitem;

@interface msettings:NSObject

+(instancetype)singleton;
-(void)save;
-(void)changecountry:(mcountryitem*)country location:(NSString*)location locationname:(NSString*)locationname;
-(NSString*)pricerange;

@property(strong, nonatomic)id<mconfigmodprotocol> searchmode;
@property(strong, nonatomic)id<mconfigtypprotocol> searchtype;
@property(strong, nonatomic)id<mconfigsorprotocol> searchorder;
@property(copy, nonatomic)NSString *location;
@property(copy, nonatomic)NSString *locationname;
@property(weak, nonatomic)mcountryitem *country;
@property(nonatomic)NSUInteger maxprice;
@property(nonatomic)NSUInteger minprice;

@end