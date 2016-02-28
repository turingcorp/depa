#import "vitem.h"

@implementation vitem
{
    CGFloat barmaxheight;
    CGFloat barminheight;
    CGFloat contactmaxtop;
    CGFloat contactmintop;
}

-(instancetype)init:(citem*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];

    self.controlleritem = controller;
    vitembar *bar = [[vitembar alloc] init:controller];
    vitemcontact *contact = [[vitemcontact alloc] init:controller];
    
    barmaxheight = 65;
    barminheight = 20;
    contactmintop = 10;
    contactmaxtop = 20;
    
    vspinner *spinner = [[vspinner alloc] init];
    [spinner startAnimating];
    self.spinner = spinner;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:2];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(200, 0, 40, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:celid];
    [collection setUserInteractionEnabled:NO];
    
    [self addSubview:collection];
    [self addSubview:bar];
    [self addSubview:contact];
    [self addSubview:spinner];
    
    self.lcbar = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:barmaxheight];
    self.lccontact = [NSLayoutConstraint constraintWithItem:contact attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:contactmintop];
    
    NSDictionary *views = @{@"contact":contact, @"bar":bar, @"collection":collection, @"spinner":spinner};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[contact(60)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[contact(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[collection]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[collection]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-100-[spinner(80)]" options:0 metrics:metrics views:views]];
    [self addConstraint:self.lcbar];
    [self addConstraint:self.lccontact];
    
    return self;
}

#pragma mark public

-(void)itemloaded
{
    
}

#pragma mark -
#pragma mark col del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offset = scroll.contentOffset.y;
    CGFloat barheight = barmaxheight - offset;
    CGFloat contacttop = contactmintop + (offset / 10.0);
    
    if(barheight < barminheight)
    {
        barheight = barminheight;
    }
    else if(barheight > barmaxheight)
    {
        barheight = barmaxheight;
    }
    
    if(contacttop > contactmaxtop)
    {
        contacttop = contactmaxtop;
    }
    else if(contacttop < contactmintop)
    {
        contacttop = contactmintop;
    }
    
    self.lcbar.constant = barheight;
    self.lccontact.constant = contacttop;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(col.bounds.size.width, 100);
    
    return size;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    UICollectionViewCell *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel setBackgroundColor:[UIColor whiteColor]];
    
    return cel;
}

@end