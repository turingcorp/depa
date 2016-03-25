#import "vliked.h"

@implementation vliked

-(instancetype)init:(cliked*)controller
{
    self = [super init:controller];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor colorWithWhite:0.96 alpha:1]];

    self.model = [[mliked alloc] init];
    vlikedflow *flow = [[vlikedflow alloc] init:self.model];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setShowsHorizontalScrollIndicator:NO];
    [collection setShowsVerticalScrollIndicator:NO];
    [collection setAlwaysBounceVertical:YES];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection registerClass:[vlikedcel class] forCellWithReuseIdentifier:celid];
    self.collection = collection;
    
    [self addSubview:collection];
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(notifiedupdateliked:) name:notlikedloaded object:nil];
    [self.model load];
    
    return self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark notified

-(void)notifiedupdateliked:(NSNotification*)notification
{
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [self addheader];
                       [self.collection reloadData];
                   });
}

#pragma mark functionality

-(void)addheader
{
    [self.header removeFromSuperview];
    
    if(!self.model.items.count)
    {
        vlikedheader *header = [[vlikedheader alloc] init];
        self.header = header;
        [self addSubview:header];
        
        NSDictionary *views = @{@"header":header};
        NSDictionary *metrics = @{};
        
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[header]-0-|" options:0 metrics:metrics views:views]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[header(300)]" options:0 metrics:metrics views:views]];
    }
}

#pragma mark public

-(void)unselect
{
    [self.collection selectItemAtIndexPath:[NSIndexPath indexPathForItem:-1 inSection:0] animated:NO scrollPosition:UICollectionViewScrollPositionNone];
}

#pragma mark -
#pragma mark col del

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)col
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView*)col numberOfItemsInSection:(NSInteger)section
{
    NSUInteger count = self.model.items.count;
    
    return count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)col cellForItemAtIndexPath:(NSIndexPath*)index
{
    mlikeditem *model = self.model.items[index.item];
    vlikedcel *cel = [col dequeueReusableCellWithReuseIdentifier:celid forIndexPath:index];
    [cel config:model];
    
    return cel;
}

-(void)collectionView:(UICollectionView*)col didSelectItemAtIndexPath:(NSIndexPath*)index
{
    mlikeditem *item = self.model.items[index.item];
    mitemdetail *itemdetail = [[mitemdetail alloc] init:item.itemid];
    itemdetail.mode = item.mode;
    itemdetail.type = item.type;
    itemdetail.contactphone = item.contactphone;
    itemdetail.status = item_status_like;
    itemdetail.dbid = item.dbid;
    
    [citem show:itemdetail];
}

@end