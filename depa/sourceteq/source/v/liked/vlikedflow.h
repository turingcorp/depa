#import "appdel.h"

@class mliked;

@interface vlikedflow:UICollectionViewFlowLayout

-(instancetype)init:(mliked*)model;

@property(weak, nonatomic)mliked *model;

@end