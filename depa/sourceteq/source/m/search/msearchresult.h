#import "appdel.h"

@class mitemitem;
@class msearch;
@class aimateqitem;

@interface msearchresult:NSObject

-(instancetype)init:(mitemitem*)item;
-(void)playlike;
-(void)playno;

@property(weak, nonatomic)mitemitem *item;
@property(weak, nonatomic)msearch *search;
@property(strong, nonatomic)aimateqitem *apiimage;
@property(copy, nonatomic)NSString *itemtitle;
@property(copy, nonatomic)NSString *itemcurrency;
@property(copy, nonatomic)NSString *phone;
@property(copy, nonatomic)NSNumber *itemprice;

@end