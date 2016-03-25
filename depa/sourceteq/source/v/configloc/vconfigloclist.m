#import "vconfigloclist.h"

static NSUInteger const cellheight = 65;
static NSUInteger const headerminheight = 100;
static NSUInteger const headermaxheight = 260;

@implementation vconfigloclist

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];

    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    [flow setFooterReferenceSize:CGSizeZero];
    [flow setMinimumInteritemSpacing:0];
    [flow setMinimumLineSpacing:2];
    [flow setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flow setSectionInset:UIEdgeInsetsMake(2, 0, 30, 0)];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection registerClass:[vconfigloclistheader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:headerid];
    [collection registerClass:[vconfigloclistcel class] forCellWithReuseIdentifier:celid];
    self.collection = collection;
    
    UIButton *buttonretry = [[UIButton alloc] init];
    [buttonretry setBackgroundColor:colormain];
    [buttonretry.layer setCornerRadius:4];
    [buttonretry.titleLabel setFont:[UIFont fontWithName:fontname size:16]];
    [buttonretry setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [buttonretry setTitleColor:[UIColor colorWithWhite:1 alpha:0.1] forState:UIControlStateHighlighted];
    [buttonretry setTitle:NSLocalizedString(@"config_location_button_retry", nil) forState:UIControlStateNormal];
    [buttonretry setClipsToBounds:YES];
    [buttonretry setTranslatesAutoresizingMaskIntoConstraints:NO];
    [buttonretry addTarget:self action:@selector(actionretry:) forControlEvents:UIControlEventTouchUpInside];
    self.buttonretry = buttonretry;
    
    vspinner *spinner = [[vspinner alloc] init];
    self.spinner = spinner;
    
    [self addSubview:spinner];
    [self addSubview:collection];
    [self addSubview:buttonretry];
    
    NSDictionary *views = @{@"col":collection, @"spinner":spinner, @"retry":buttonretry};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[spinner]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-120-[spinner(40)]" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-80-[retry]-80-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-140-[retry(40)]" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedloclistitemfetched:) name:notloclistitemfetched object:nil];
    
    mconfigloclistitem *item = [[mconfigloclistitem alloc] init];
    item.strategy = [sconfigloccountry class];
    [self load:item];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)setSelected:(BOOL)selected
{
}

-(void)setHighlighted:(BOOL)highlighted
{
}

#pragma mark notified

-(void)notifiedloclistitemfetched:(NSNotification*)notification
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self refreshcol];
                   });
}

#pragma mark actions

-(void)actionretry:(UIButton*)button
{
    [self load:self.model];
}

#pragma mark functionality

-(void)refreshcol
{
    [self.spinner stopAnimating];
    [self.spinner setHidden:YES];
    
    if(self.model.error)
    {
        [self.buttonretry setHidden:NO];
        [self errorfound:self.model.error];
    }
    else
    {
        [self.collection setHidden:NO];
        [self.collection scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:NO];
        [self.collection reloadData];
        
        if(![self.model count])
        {
            [self accept];
        }
    }
}

-(void)errorfound:(NSString*)error
{
    //NSLog(@"%@", error);
    [valert alert:error inview:self offsettop:0];
}

#pragma mark public

-(void)load:(mconfigloclistitem*)item
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       self.model = item;
                       [self.buttonretry setHidden:YES];
                       [self.collection setHidden:YES];
                       [self.spinner setHidden:NO];
                       [self.spinner startAnimating];
                       
                       dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                                      ^
                                      {
                                          [item fetch];
                                      });
                   });
}

-(void)accept
{
    [[analytics singleton] trackevent:ga_event_location action:ga_action_list label:nil];
    
    [[msettings singleton] changecountry:self.model.country location:[self.model path] locationname:self.model.title];
    [[cmain singleton] popViewControllerAnimated:YES];
}

-(void)back
{
    self.model = self.model.parent;
    [self refreshcol];
}

#pragma mark -
#pragma mark col del

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout referenceSizeForHeaderInSection:(NSInteger)section
{
    CGFloat height = headerminheight;
    
    if(self.model.parent)
    {
        height = headermaxheight;
    }
    
    CGSize size = CGSizeMake(col.bounds.size.width, height);
    
    return size;
}

-(CGSize)collectionView:(UICollectionView*)col layout:(UICollectionViewLayout*)layout sizeForItemAtIndexPath:(NSIndexPath*)index
{
    CGSize size = CGSizeMake(col.bounds.size.width, cellheight);
    
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

-(UICollectionReusableView*)collectionView:(UICollectionView*)col viewForSupplementaryElementOfKind:(NSString*)kind atIndexPath:(NSIndexPath*)index
{
    vconfigloclistheader *header = [col dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerid forIndexPath:index];
    [header config:self];
    
    return header;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    vconfigloclistcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:[self.model item:index.item]];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mconfigloclistitem *item = [self.model item:index.item];
    
    if(item.strategy)
    {
        [self load:item];
    }
    else
    {
        self.model = item;
        [self accept];
    }
}

@end