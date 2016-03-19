#import "appdel.h"

@class msearchresult;
@class vplayitemimagelike;

@interface vplayitemimage:UIView

-(instancetype)init:(msearchresult*)model;
-(void)like;
-(void)no;

@property(weak, nonatomic)msearchresult *model;
@property(weak, nonatomic)vplayitemimagelike *likeover;
@property(weak, nonatomic)UIImageView *image;

@end