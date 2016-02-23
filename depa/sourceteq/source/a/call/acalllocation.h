#import "appdel.h"
#import "acall.h"

@interface acalllocation:acall

-(instancetype)init:(id)variables country:(mcountryitem*)country;

@property(weak, nonatomic)mcountryitem *country;

@end