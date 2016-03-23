#import "vitemcar.h"



@implementation vitemcar

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

    vitemcarpaging *paging = [[vitemcarpaging alloc] init:controller];
    self.paging = paging;
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

@end