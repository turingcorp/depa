#import "vconfigsort.h"

static NSUInteger const cellwidth = 80;

@implementation vconfigsort

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    self.model = [[mconfigsor alloc] init];
    self.selected = 0;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setClipsToBounds:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vconfigsortcel class] forCellWithReuseIdentifier:celid];
    self.collection = collection;
    
    UILabel *labeltitle = [[UILabel alloc] init];
    [labeltitle setBackgroundColor:[UIColor clearColor]];
    [labeltitle setUserInteractionEnabled:NO];
    [labeltitle setTranslatesAutoresizingMaskIntoConstraints:NO];
    [labeltitle setTextColor:[UIColor colorWithWhite:0 alpha:0.6]];
    [labeltitle setFont:[UIFont fontWithName:fontname size:14]];
    [labeltitle setText:NSLocalizedString(@"config_sort_title", nil)];
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
        id<mconfigsorprotocol> item = [self.model item:i];
        
        if([item type] == [[msettings singleton].searchorder type])
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
    CGFloat totalwidth = col.bounds.size.width;
    CGFloat cellswidth = cellwidth * [self.model count];
    CGFloat margin = (totalwidth - cellswidth) / 2.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat cellheight = col.bounds.size.height;
    CGSize size = CGSizeMake(cellwidth, cellheight);
    
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
    vconfigsortcel *cell = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cell config:[self.model item:index.item]];
    
    return cell;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    NSUInteger item = index.item;
    
    if(item != self.selected)
    {
        id<mconfigsorprotocol> model = [self.model item:item];
        [msettings singleton].searchorder = model;
        [[msettings singleton] save];
        self.selected = item;
        
        [[analytics singleton] trackevent:ga_event_config_order action:ga_action_change label:[model title]];
    }
}

#pragma mark config cel protocol

-(void)hover:(BOOL)hover
{
}

@end