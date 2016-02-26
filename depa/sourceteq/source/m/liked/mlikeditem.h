#import "appdel.h"

@interface mlikeditem:NSObject

-(instancetype)init:(UIFont*)font;
-(void)title:(NSString*)title currency:(NSString*)currency price:(NSNumber*)price;
-(CGFloat)heightforwidth:(CGFloat)width;

@property(weak, nonatomic)UIFont *font;
@property(strong, nonatomic)NSMutableAttributedString *display;

@end