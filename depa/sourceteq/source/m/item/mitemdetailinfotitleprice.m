#import "mitemdetailinfotitleprice.h"

@implementation mitemdetailinfotitleprice
{
    NSMutableAttributedString *mutstring;
    CGFloat cellheight;
    CGFloat marginvertical;
    CGFloat marginhorizontal;
}

-(instancetype)init
{
    self = [super init];
    
    marginvertical = 30;
    marginhorizontal = 20;
    
    return self;
}

#pragma mark -
#pragma amrk detail info protocol

-(void)config:(mitemdetail*)item collection:(UICollectionView*)collection
{
    NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont fontWithName:fontname size:17], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.45]};
    NSDictionary *attrprice = @{NSFontAttributeName:[UIFont fontWithName:fontname size:15], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.3]};
    mutstring = [[NSMutableAttributedString alloc] init];
    [mutstring appendAttributedString:[[NSAttributedString alloc] initWithString:item.itemtitle attributes:attrtitle]];
    [mutstring appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n" attributes:attrprice]];
    [mutstring appendAttributedString:[[NSAttributedString alloc] initWithString:item.itemprice attributes:attrprice]];
    
    CGFloat colwidth = collection.bounds.size.width;
    CGFloat textwidth = colwidth - (marginhorizontal * 2);
    CGFloat textheight = ceilf([mutstring boundingRectWithSize:CGSizeMake(textwidth, 200) options:stringdrawing context:nil].size.height);
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
    [overview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(vertical)-[label]-(vertical)-|" options:0 metrics:metrics views:views]];
    
    return overview;
}

-(CGFloat)height
{
    return cellheight;
}

@end