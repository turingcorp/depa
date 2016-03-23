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
    
    NSDictionary *views = @{@"col":collection};
    NSDictionary *metrics = @{};
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[col]-0-|" options:0 metrics:metrics views:views]];
    
    return self;
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