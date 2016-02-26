#import "appdel.h"

@class mliked;

@interface mlikeditem:NSObject

-(instancetype)init:(mliked*)model;
-(void)title:(NSString*)title currency:(NSString*)currency price:(NSNumber*)price;
-(CGFloat)heightforwidth:(CGFloat)width;

@property(weak, nonatomic)mliked *model;
@property(strong, nonatomic)NSMutableAttributedString *display;

@end