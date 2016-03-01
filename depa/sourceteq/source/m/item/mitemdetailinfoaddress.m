#import "mitemdetailinfoaddress.h"

@implementation mitemdetailinfoaddress
{
    NSMutableAttributedString *mutstring;
    CGFloat cellheight;
    CGFloat marginvertical;
    CGFloat marginhorizontal;
    CGFloat iconheight;
}

-(instancetype)init
{
    self = [super init];
    
    marginvertical = 15;
    marginhorizontal = 20;
    iconheight = 70;
    
    return self;
}

#pragma mark actions

-(void)actionmap:(UIButton*)button
{
    
    
//    [[cmain singleton] presentViewController:controller animated:YES completion:nil];
}

#pragma mark -
#pragma amrk detail info protocol

-(void)config:(mitemdetail*)item collection:(UICollectionView*)collection
{
    self.item = item;
    
    NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont fontWithName:fontname size:17], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.4]};
    mutstring = [[NSMutableAttributedString alloc] init];
    [mutstring appendAttributedString:[[NSAttributedString alloc] initWithString:item.itemaddress attributes:attrtitle]];
    
    CGFloat colwidth = collection.bounds.size.width;
    CGFloat textwidth = colwidth - (marginhorizontal * 2);
    CGFloat textheight = ceilf([mutstring boundingRectWithSize:CGSizeMake(textwidth, 2000) options:stringdrawing context:nil].size.height);
    cellheight = textheight + (marginvertical * 2);
    
    if(item.latitude && item.longitude)
    {
        cellheight += iconheight + marginvertical;
    }
}

-(UIView*)overview
{
    UIView *overview = [[UIView alloc] init];
    [overview setClipsToBounds:YES];
    [overview setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setNumberOfLines:0];
    [label setAttributedText:mutstring];
    
    UIButton *button = [[UIButton alloc] init];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button.imageView setContentMode:UIViewContentModeScaleAspectFit];
    [button.imageView setClipsToBounds:YES];
    [button.imageView setTintColor:colorsecond];
    [button setImage:[[UIImage imageNamed:@"map"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate] forState:UIControlStateNormal];
    [button setImage:[[UIImage imageNamed:@"map"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(actionmap:) forControlEvents:UIControlEventTouchUpInside];
    
    [overview addSubview:label];
    [overview addSubview:button];
    
    NSDictionary *views = @{@"label":label, @"icon":button};
    NSDictionary *metrics = @{@"horizontal":@(marginhorizontal), @"vertical":@(marginvertical), @"iconheight":@(iconheight)};
    
    [overview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-(horizontal)-[label]-(horizontal)-|" options:0 metrics:metrics views:views]];
    [overview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[icon]-0-|" options:0 metrics:metrics views:views]];
    [overview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-(vertical)-[label]-(vertical)-[icon(iconheight)]" options:0 metrics:metrics views:views]];
    
    return overview;
}

-(CGFloat)height
{
    return cellheight;
}

@end