#import "vplayitemheader.h"

@implementation vplayitemheader

-(instancetype)init:(msearchresult*)model
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:colormain];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    
    NSDictionary *attrnorm = @{NSFontAttributeName:[UIFont fontWithName:fontname size:12], NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:0.75]};
    NSDictionary *attrhl = @{NSFontAttributeName:[UIFont fontWithName:fontboldname size:12], NSForegroundColorAttributeName:[UIColor colorWithWhite:1 alpha:0.4]};
    NSString *stringcurrent = [[tools singleton] numbertostring:@(model.search.current)];
    NSString *stringtotal = [NSString stringWithFormat:NSLocalizedString(@"play_item_header_of", nil), [[tools singleton] numbertostring:@(model.search.total)]];
    
    NSMutableAttributedString *mut = [[NSMutableAttributedString alloc] init];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:model.search.displayname attributes:attrnorm]];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:stringcurrent attributes:attrnorm]];
    [mut appendAttributedString:[[NSAttributedString alloc] initWithString:stringtotal attributes:attrhl]];
    
    UILabel *label = [[UILabel alloc] init];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setUserInteractionEnabled:NO];
    [label setTranslatesAutoresizingMaskIntoConstraints:NO];
    [label setTextAlignment:NSTextAlignmentRight];
    [label setAttributedText:mut];
    
    [self addSubview:label];
    
    NSDictionary *views = @{@"label":label};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[label]-12-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[label]-3-|" options:0 metrics:metrics views:views]];
    
    return self;
}

@end