#import "appdel.h"

@class mconfigloclistitem;

@interface vconfigloclistheader:UICollectionReusableView

-(void)config:(mconfigloclistitem*)model;

@property(weak, nonatomic)UILabel *label;

@end