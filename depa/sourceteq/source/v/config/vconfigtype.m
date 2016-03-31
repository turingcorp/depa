#import "vconfigtype.h"

static NSUInteger const cellwidth = 80;

@implementation vconfigtype

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];

    self.model = [[mconfigtyp alloc] init];
    self.selected = 0;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vconfigtypecel class] forCellWithReuseIdentifier:celid];
    self.collection = collection;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setFont:[UIFont fontWithName:fontname size:14]];
    [labeltitle setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [labeltitle setText:NSLocalizedString(@"config_type_title", nil)];
    [labeltitle setTextAlignment:NSTextAlignmentCenter];
    
    [self addSubview:labeltitle];
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection, @"labeltitle":labeltitle};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[labeltitle]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-14-[labeltitle(16)]-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    NSUInteger count = [self.model count];
    for(NSUInteger i = 0; i < count; i++)
    {
        id<mconfigtypprotocol> item = [self.model item:i];
        
        if([item type] == [[msettings singleton].searchtype type])
        {
            self.selected = i;
            
            break;
        }
    }
    
    [collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:self.selected inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGFloat totalcells = cellwidth * [self.model count];
    CGFloat margin = (width - totalcells) / 2.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(cellwidth, col.bounds.size.height);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = [self.model count];
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vconfigtypecel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item]];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    NSUInteger item = index.item;
    
    if(item != self.selected)
    {
        id<mconfigtypprotocol> model = [self.model item:item];
        [msettings singleton].searchtype = model;
        [[msettings singleton] save];
        self.selected = item;
        
        [[analytics singleton] trackevent:ga_event_config_type action:ga_action_change label:[model title]];
    }
}

#pragma mark config cel protocol

-(void)hover:(BOOL)hover
{
}

@end