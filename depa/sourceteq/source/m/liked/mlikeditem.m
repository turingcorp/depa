#import "mlikeditem.h"

@implementation mlikeditem

-(instancetype)init:(UIFont*)font
{
    self = [super init];
    
    self.font = font;
    
    return self;
}

#pragma mark public

-(void)title:(NSString*)title currency:(NSString*)currency price:(NSNumber*)price
{
    NSDictionary *attributes = @{NSFontAttributeName:self.font};
    NSString *pricestring = [NSString stringWithFormat:@"\n%@", [[tools singleton] pricetostring:price currency:currency]];
    
    self.display = [[NSMutableAttributedString alloc] init];
    [self.display appendAttributedString:[[NSAttributedString alloc] initWithString:title attributes:attributes]];
    [self.display appendAttributedString:[[NSAttributedString alloc] initWithString:pricestring attributes:attributes]];
}

-(CGFloat)heightforwidth:(CGFloat)width;
{
    CGFloat height = ceilf([self.display boundingRectWithSize:CGSizeMake(width, 300) options:stringdrawing context:nil].size.height);
    
    return height;
}

@end