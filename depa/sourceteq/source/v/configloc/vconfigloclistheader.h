#import "appdel.h"

@class vconfigloclist;

@interface vconfigloclistheader:UICollectionReusableView

-(void)config:(vconfigloclist*)list;

@property(weak, nonatomic)vconfigloclist *list;
@property(weak, nonatomic)UILabel *labelcurrent;
@property(weak, nonatomic)UILabel *label;

@end