#import "appdel.h"

@interface msettings:NSObject

+(instancetype)singleton;
-(void)save;

@property(copy, nonatomic)NSString *fontselected;
@property(nonatomic)NSUInteger fontsize;
@property(nonatomic)BOOL highresolution;

@end