#import "appdel.h"

@class mconfigloclistitem;

@interface vconfigloclistcel:UICollectionViewCell

-(void)config:(mconfigloclistitem*)model;

@property(weak, nonatomic)UILabel *label;

@end