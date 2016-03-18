#import "mitemdetailinfoaddress.h"

static NSUInteger const consmarginvertical = 15;
static NSUInteger const consmarginhorizontal = 20;
static NSUInteger const consiconheight = 160;

@implementation mitemdetailinfoaddress

-(instancetype)init
{
    self = [super init];
    
    self.marginvertical = consmarginvertical;
    self.marginhorizontal = consmarginhorizontal;
    self.iconheight = consiconheight;
    
    return self;
}

#pragma mark -
#pragma amrk detail info protocol

-(void)config:(mitemdetail*)item collection:(UICollectionView*)collection
{
    self.item = item;
    
    NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont fontWithName:fontname size:17], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.4]};
    self.mutstring = [[NSMutableAttributedString alloc] init];
    [self.mutstring appendAttributedString:[[NSAttributedString alloc] initWithString:item.itemaddress attributes:attrtitle]];
    
    CGFloat colwidth = collection.bounds.size.width;
    CGFloat textwidth = colwidth - (self.marginhorizontal * 2);
    CGFloat textheight = ceilf([self.mutstring boundingRectWithSize:CGSizeMake(textwidth, 2000) options:stringdrawing context:nil].size.height);
    self.cellheight = textheight + (self.marginvertical * 2);
    
    if(item.latitude && item.longitude)
    {
        self.cellheight += self.iconheight;
    }
}

-(UIView*)overview
{
    vitemceladdress *overview = [[vitemceladdress alloc] init:self];
    
    return overview;
}

-(CGFloat)height
{
    return self.cellheight;
}

@end