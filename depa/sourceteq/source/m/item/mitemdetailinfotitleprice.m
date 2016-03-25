#import "mitemdetailinfotitleprice.h"

static NSUInteger const marginvertical = 30;
static NSUInteger const marginhorizontal = 20;

@implementation mitemdetailinfotitleprice
{
    NSMutableAttributedString *mutstring;
    CGFloat cellheight;
}

#pragma mark -
#pragma amrk detail info protocol

-(void)config:(mitemdetail*)item view:(vitem*)view
{
    NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont fontWithName:fontname size:21], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.8]};
    NSDictionary *attrprice = @{NSFontAttributeName:[UIFont fontWithName:fontname size:26], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.4]};
    NSString *stringprice = item.itemprice;
    NSString *stringtitle = item.itemtitle;
    
    if(!stringprice)
    {
        stringprice = @"";
    }
    
    if(!stringtitle)
    {
        stringtitle = @"";
    }
    
    mutstring = [[NSMutableAttributedString alloc] init];
    [mutstring appendAttributedString:[[NSAttributedString alloc] initWithString:stringprice attributes:attrprice]];
    [mutstring appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:attrprice]];
    [mutstring appendAttributedString:[[NSAttributedString alloc] initWithString:stringtitle attributes:attrtitle]];
    
    CGFloat colwidth = view.bounds.size.width;
    CGFloat textwidth = colwidth - (marginhorizontal * 2);
    CGFloat textheight = ceilf([mutstring boundingRectWithSize:CGSizeMake(textwidth, 2000) options:stringdrawing context:nil].size.height);
    cellheight = textheight + (marginvertical * 2);
}

-(UIView*)overview
{
    UIView *overview = [[UIView alloc] init];
    [overview setClipsToBounds:YES];
    [overview setUserInteractionEnabled:NO];
    [overview setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setAttributedText:mutstring];
    
    [overview addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{@"horizontal":@(marginhorizontal), @"vertical":@(marginvertical)};
    
    [overview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(horizontal)-[label]-(horizontal)-|" options:0 metrics:metrics views:views]];
    [overview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[label]-0-|" options:0 metrics:metrics views:views]];
    
    return overview;
}

-(CGFloat)height
{
    return cellheight;
}

@end