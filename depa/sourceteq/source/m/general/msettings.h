#import "appdel.h"
#import "mconfigmodprotocol.h"

@interface msettings:NSObject

+(instancetype)singleton;
-(void)save;

@property(strong, nonatomic)id<mconfigmodprotocol> searchmode;
@property(strong, nonatomic)id<mconfigtypprotocol> searchtype;

@end