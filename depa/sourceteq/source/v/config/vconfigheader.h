#import "appdel.h"

@class mconfigsection;

@interface vconfigheader:UICollectionReusableView

-(void)config:(mconfigsection*)model;

@property(weak, nonatomic)UILabel *label;

@end