#import "appdel.h"

@class mliked;
@class aimateqitem;

@interface mlikeditem:NSObject

-(instancetype)init:(mliked*)model;
-(void)title:(NSString*)title currency:(NSString*)currency price:(NSNumber*)price;
-(CGFloat)heightforwidth:(CGFloat)width;

@property(weak, nonatomic)mliked *model;
@property(strong, nonatomic)aimateqitem *apiimage;
@property(strong, nonatomic)NSMutableAttributedString *display;
@property(copy, nonatomic)NSString *thumbnail;

@end