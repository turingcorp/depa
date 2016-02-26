#import "appdel.h"

static const NSUInteger vlikedcellhrpadding = 8;
static const NSUInteger vlikedcellbottompadding = 10;
static const NSUInteger vlikedcellspacing = 8;
static const NSUInteger vlikedcellimageheight = 170;

@class mlikeditem;

@interface vlikedcel:UICollectionViewCell

-(void)config:(mlikeditem*)item;

@property(weak, nonatomic)mlikeditem *item;
@property(weak, nonatomic)UIView *basegeneral;
@property(weak, nonatomic)UIView *baseimage;
@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UILabel *label;

@end