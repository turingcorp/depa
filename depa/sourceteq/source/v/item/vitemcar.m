#import "vitemcar.h"

@implementation vitemcar
{
    CGFloat cellwidth;
    CGFloat cellheight;
    CGFloat interline;
}

-(instancetype)init:(citem*)controller
{
    self = [super init];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self setClipsToBounds:YES];
    [self setUserInteractionEnabled:NO];
    
    self.controller = controller;
    cellwidth = 0;
    cellheight = 0;
    interline = 0;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [flow setSectionInset:UIEdgeInsetsMake(0, 0, 1, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setBounces:NO];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[vitemcarcel class] forCellWithReuseIdentifier:celid];
    self.collection = collection;

    vitemcarpaging *paging = [[vitemcarpaging alloc] init:controller];
    self.paging = paging;
    
    [self addSubview:collection];
    [self addSubview:paging];
    
    NSDictionary *views = @{@"col":collection, @"paging":paging};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[paging]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[paging(11)]-20-|" options:0 metrics:metrics views:views]];
    
    return self;
}

-(void)layoutSubviews
{
    [self.collection.collectionViewLayout invalidateLayout];
    [super layoutSubviews];
}

#pragma mark public

-(void)refresh
{
    cellwidth = self.collection.bounds.size.width;
    
    if(cellwidth > 900)
    {
        cellwidth = 700;
        interline = 3;
        [self.collection setPagingEnabled:NO];
    }
    else
    {
        interline = 0;
        [self.collection setPagingEnabled:YES];
    }
    
    [self.collection reloadData];
    [self.paging.collection reloadData];
    
    if([self.controller.item.images count])
    {
        [self.paging.collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    }
}

#pragma mark -
#pragma mark col del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat leftoffset = scroll.contentOffset.x;
    
    CGPoint point = CGPointMake(leftoffset + (scroll.bounds.size.width / 2.0), 3);
    NSIndexPath *index = [self.collection indexPathForItemAtPoint:point];
    
    if(index)
    {
        [self.paging.collection selectItemAtIndexPath:index animated:NO scrollPosition:UICollectionViewScrollPositionNone];
    }
}

-(CGFloat)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return interline;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    cellheight = col.bounds.size.height - 1;
    CGSize size = CGSizeMake(cellwidth, cellheight);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = [self.controller.item.images count];
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vitemcarcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.controller.item.images item:index.item]];
    
    return cel;
}

@end