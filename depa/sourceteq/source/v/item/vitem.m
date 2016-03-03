#import "vitem.h"

@implementation vitem
{
    CGFloat barmaxheight;
    CGFloat barminheight;
    CGFloat contactmaxtop;
    CGFloat contactmintop;
    CGFloat carheight;
    CGFloat carminheight;
}

-(instancetype)init:(citem*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.97 alpha:1]];

    self.controlleritem = controller;
    self.model = [[mitemdetailinfo alloc] init];
    vitembar *bar = [[vitembar alloc] init:controller];
    vitemcontact *contact = [[vitemcontact alloc] init:controller];
    [contact addTarget:self action:@selector(actioncontact:) forControlEvents:UIControlEventTouchUpInside];
    
    carheight = 350;
    barmaxheight = 65;
    barminheight = 20;
    contactmintop = 10;
    contactmaxtop = 20;
    carminheight = 120;
    
    vspinner *spinner = [[vspinner alloc] init];
    [spinner startAnimating];
    self.spinner = spinner;
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setHeaderReferenceSize:CGSizeZero];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:2];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(carheight, 0, 60, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection registerClass:[vitemcel class] forCellWithReuseIdentifier:celid];
    [collection setHidden:YES];
    self.collection = collection;
    
    vitemcar *car = [[vitemcar alloc] init:self.controlleritem];
    [car setHidden:YES];
    self.car = car;
    
    [self addSubview:collection];
    [self addSubview:car];
    [self addSubview:bar];
    [self addSubview:contact];
    [self addSubview:spinner];
    
    self.lcbar = [NSLayoutConstraint constraintWithItem:bar attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:barmaxheight];
    self.lccontact = [NSLayoutConstraint constraintWithItem:contact attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:contactmintop];
    self.lccar = [NSLayoutConstraint constraintWithItem:car attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1 constant:carheight];
    self.lccartop = [NSLayoutConstraint constraintWithItem:car attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1 constant:barmaxheight];
    
    NSDictionary *views = @{@"contact":contact, @"bar":bar, @"collection":collection, @"spinner":spinner, @"car":car};
    NSDictionary *metrics = @{@"carheight":@(carheight)};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[contact(60)]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[contact(60)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[collection]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bar]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[bar]-100-[spinner(80)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[car]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bar]-0-[collection]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraint:self.lcbar];
    [self addConstraint:self.lccontact];
    [self addConstraint:self.lccar];
    [self addConstraint:self.lccartop];
    
    return self;
}

#pragma mark actions

-(void)actiontryagain:(UIButton*)button
{
    [button removeFromSuperview];
    [self.spinner startAnimating];
    [self.controlleritem tryagain];
}

-(void)actioncontact:(UIButton*)button
{
    [self.controlleritem contact];
}

#pragma mark public

-(void)itemloaded
{
    [self.spinner stopAnimating];
    [self.spinner removeFromSuperview];
    [self.collection setHidden:NO];
    [self.car setHidden:NO];
    [self.collection reloadData];
    [self.car refresh];
}

-(void)descriptionloaded
{
    [self.collection reloadData];
}

-(void)errorloading
{
    [self.spinner stopAnimating];
    
    UIButton *button = [[UIButton alloc] init];
    [button setBackgroundColor:colorsecond];
    [button setClipsToBounds:YES];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [button setTitle:NSLocalizedString(@"item_detail_buttonretry", nil) forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont fontWithName:fontboldname size:16]];
    [button addTarget:self action:@selector(actiontryagain:) forControlEvents:UIControlEventTouchUpInside];
    [button.layer setCornerRadius:4];
    
    [self addSubview:button];
    
    NSDictionary *views = @{@"button":button};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[button]-80-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-185-[button(40)]" options:0 metrics:metrics views:views]];
}

#pragma mark -
#pragma mark col del

-(void)scrollViewDidScroll:(UIScrollView*)scroll
{
    CGFloat offset = self.collection.contentOffset.y;
    CGFloat offset_10 = offset / 10.0;
    CGFloat barheight = barmaxheight - offset;
    CGFloat contacttop = contactmintop + offset_10;
    CGFloat newcarheight = carheight - offset;
    CGFloat cartop;
    
    if(barheight < barminheight)
    {
        barheight = barminheight;
    }
    else if(barheight > barmaxheight)
    {
        barheight = barmaxheight;
    }
    
    cartop = barheight;
    
    if(contacttop > contactmaxtop)
    {
        contacttop = contactmaxtop;
    }
    else if(contacttop < contactmintop)
    {
        contacttop = contactmintop;
    }
    
    if(newcarheight < carminheight)
    {
        CGFloat delta = carminheight - newcarheight;
        newcarheight = carminheight;
        cartop -= delta;
    }
    
    self.lcbar.constant = barheight;
    self.lccontact.constant = contacttop;
    self.lccar.constant = newcarheight;
    self.lccartop.constant = cartop;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGFloat height = [[self.model item:index.item] height];
    CGSize size = CGSizeMake(col.bounds.size.width, height);
    
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
    vitemcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[[self.model item:index.item] overview]];
    
    return cel;
}

@end