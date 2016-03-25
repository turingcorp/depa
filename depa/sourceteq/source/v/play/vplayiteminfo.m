#import "vplayiteminfo.h"

@implementation vplayiteminfo

-(instancetype)init:(msearchresult*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setUserInteractionEnabled:NO];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    NSDictionary *dicttitle = @{NSFontAttributeName:[UIFont fontWithName:fontname size:15], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.5]};
    NSDictionary *dictprice = @{NSFontAttributeName:[UIFont fontWithName:fontname size:20], NSForegroundColorAttributeName:[UIColor colorWithWhite:0 alpha:0.7]};
    
    NSString *stringtitle = [NSString stringWithFormat:@"\n%@", model.itemtitle];
    NSString *stringprice = [[tools singleton] pricetostring:model.itemprice currency:model.itemcurrency];
    
    NSAttributedString *attrtitle = [[NSAttributedString alloc] initWithString:stringtitle attributes:dicttitle];
    NSAttributedString *attrprice = [[NSAttributedString alloc] initWithString:stringprice attributes:dictprice];
    
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:attrprice];
    [mut appendAttributedString:attrtitle];
    
    UILabel *label = [[UILabel alloc] init];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setText:model.itemtitle];
    [label setNumberOfLines:0];
    [label setAttributedText:mut];
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-10-[label]-10-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-10-[label]" options:0 metrics:metrics views:views]];
    
    return self;
}

@end