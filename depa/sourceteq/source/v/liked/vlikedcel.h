#import "appdel.h"

static const NSUInteger vlikedcellhrpadding = 6;
static const NSUInteger vlikedcellbottompadding = 8;
static const NSUInteger vlikedcellspacing = 4;
static const NSUInteger vlikedcellimageheight = 160;

@class mlikeditem;

@interface vlikedcel:UICollectionViewCell

-(void)config:(mlikeditem*)item;

@property(weak, nonatomic)mlikeditem *item;
@property(weak, nonatomic)UIView *basegeneral;
@property(weak, nonatomic)UIView *baseimage;
@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UILabel *label;

@end