#import "vitemcarpaging.h"

@implementation vitemcarpaging
{
    CGFloat interitem;
}

-(instancetype)init:(citem*)controller
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setUserInteractionEnabled:NO];
    
    interitem = 1;
    self.controller = controller;
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:interitem];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vitemcarpagingcel class] forCellWithReuseIdentifier:celid];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
}

#pragma mark -
#pragma mark col del

-(UIEdgeInsets)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat totalwidth = col.bounds.size.width;
    CGFloat circlesize = col.bounds.size.height + interitem;
    CGFloat totalcircles = circlesize * self.controller.item.images.items.count;
    CGFloat margin = (totalwidth - totalcircles) / 2.0;
    
    if(margin < 1)
    {
        margin = 0;
    }
    
    UIEdgeInsets insets = UIEdgeInsetsMake(0, margin, 0, margin);
    
    return insets;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat side = col.bounds.size.height;
    CGSize size = CGSizeMake(side, side);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = self.controller.item.images.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vitemcarpagingcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    
    return cel;
}

@end