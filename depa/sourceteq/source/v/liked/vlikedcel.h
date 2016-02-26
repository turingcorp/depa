#import "appdel.h"

static const NSUInteger vlikedcellhrpadding = 6;
static const NSUInteger vlikedcellbottompadding = 6;
static const NSUInteger vlikedcellspacing = 4;
static const NSUInteger vlikedcellimageheight = 90;

@class mlikeditem;

@interface vlikedcel:UICollectionViewCell

-(void)config:(mlikeditem*)item;

@property(weak, nonatomic)mlikeditem *item;
@property(weak, nonatomic)UILabel *label;

@end