#import "appdel.h"

@class vconfigloclist;

@interface vconfigloclistheader:UICollectionReusableView

-(void)config:(vconfigloclist*)list;

@property(weak, nonatomic)vconfigloclist *list;
@property(weak, nonatomic)UIButton *buttoncurrent;
@property(weak, nonatomic)UIButton *buttonback;
@property(weak, nonatomic)UILabel *label;

@end