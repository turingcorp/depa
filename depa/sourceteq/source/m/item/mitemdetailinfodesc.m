#import "mitemdetailinfodesc.h"

static NSUInteger const marginvertical = 30;
static NSUInteger const marginhorizontal = 20;

@implementation mitemdetailinfodesc
{
    NSAttributedString *attrstring;
    CGFloat cellheight;
}

#pragma mark -
#pragma amrk detail info protocol

-(void)config:(mitemdetail*)item view:(vitem*)view
{
    NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont fontWithName:fontname size:19], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.6]};
    NSString *stringdescr = item.itemdesc;
    
    if(!stringdescr)
    {
        stringdescr = @"";
    }
    
    attrstring = [[NSAttributedString alloc] initWithString:stringdescr attributes:attrtitle];
    
    CGFloat colwidth = view.bounds.size.width;
    CGFloat textwidth = colwidth - (marginhorizontal * 2);
    CGFloat textheight = ceilf([attrstring boundingRectWithSize:CGSizeMake(textwidth, 2000) options:stringdrawing context:nil].size.height);
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
    [label setAttributedText:attrstring];
    
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