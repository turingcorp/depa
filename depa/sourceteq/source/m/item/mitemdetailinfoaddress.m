#import "mitemdetailinfoaddress.h"

static NSUInteger const consmarginvertical = 30;
static NSUInteger const consmarginhorizontal = 20;

@implementation mitemdetailinfoaddress

-(instancetype)init
{
    self = [super init];
    
    self.marginvertical = consmarginvertical;
    self.marginhorizontal = consmarginhorizontal;
    
    return self;
}

#pragma mark -
#pragma amrk detail info protocol

-(void)config:(mitemdetail*)item view:(vitem*)view
{
    self.item = item;
    
    NSDictionary *attrtitle = @{NSFontAttributeName:[UIFont fontWithName:fontname size:17], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.5]};
    NSString *stringaddress = item.itemaddress;
    
    if(!stringaddress)
    {
        stringaddress = @"";
    }
    
    self.attrstring = [[NSAttributedString alloc] initWithString:stringaddress attributes:attrtitle];
    
    CGFloat colwidth = view.bounds.size.width;
    CGFloat textwidth = colwidth - (self.marginhorizontal * 2);
    CGFloat textheight = ceilf([self.attrstring boundingRectWithSize:CGSizeMake(textwidth, 2000) options:stringdrawing context:nil].size.height);
    self.cellheight = textheight + (self.marginvertical * 2);
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