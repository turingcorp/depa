#import "mlikeditem.h"

@implementation mlikeditem

-(instancetype)init:(mliked*)model
{
    self = [super init];
    
    self.model = model;
    
    return self;
}

#pragma mark public

-(void)title:(NSString*)title currency:(NSString*)currency price:(NSNumber*)price
{
    NSDictionary *atttitle = @{NSFontAttributeName:self.model.fonttitle};
    NSDictionary *attprice = @{NSFontAttributeName:self.model.fontprice};
    NSString *pricestring = [NSString stringWithFormat:@"%@\n", [[tools singleton] pricetostring:price currency:currency]];
    
    self.display = [[NSMutableAttributedString alloc] init];
    [self.display appendAttributedString:[[NSAttributedString alloc] initWithString:pricestring attributes:attprice]];
    [self.display appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:atttitle]];
}

-(CGFloat)heightforwidth:(CGFloat)width;
{
    CGFloat height = ceilf([self.display boundingRectWithSize:CGSizeMake(width, 300) options:stringdrawing context:nil].size.height);
    
    return height;
}

@end