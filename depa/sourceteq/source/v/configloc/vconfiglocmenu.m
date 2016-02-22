#import "vconfiglocmenu.h"

@implementation vconfiglocmenu
{
    NSUInteger cellwidth;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setClipsToBounds:YES];
    
    cellwidth = 100;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] init];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setDataSource:self];
    [collection setDelegate:self];
    self.collection = collection;
    
    [self addSubview:collection];
    
    return self;
}

#pragma mark public

-(void)location:(vconfigloc*)configloc
{
    self.configloc = configloc;
}

#pragma mark -
#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat width = col.bounds.size.width;
    CGFloat cellswidth = cellwidth * [self.configloc.model count];
    CGFloat margin = (width - cellswidth) / 2.0;
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = [self.configloc.model count];
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vconfiglocmenucel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel setSelected:index.item == self.configloc.model.selected];
    
    return cel;
}

@end