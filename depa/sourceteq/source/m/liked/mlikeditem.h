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
@property(copy, nonatomic)NSString *itemid;
@property(copy, nonatomic)NSString *thumbnail;
@property(copy, nonatomic)NSString *contactphone;
@property(nonatomic)search_type type;
@property(nonatomic)search_mode mode;
@property(nonatomic)NSUInteger dbid;

@end