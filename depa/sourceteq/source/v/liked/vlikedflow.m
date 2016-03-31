#import "vlikedflow.h"

static NSUInteger const mincols = 2;
static NSUInteger const maxcols = 3;

@implementation vlikedflow
{
    NSMutableArray *attrs;
    CGFloat addedwidth;
    CGFloat addedheight;
    CGFloat padding;
    CGFloat padding_2;
    CGFloat padding2;
    CGFloat totalwidth;
    CGFloat totalheight;
    CGFloat totalcellwidth;
}

-(instancetype)init:(mliked*)model
{
    self = [super init];
    
    self.model = model;
    padding = 4;
    padding_2 = padding / 2;
    padding2 = padding * 2;
    addedwidth = vlikedcellhrpadding * 2;
    addedheight = vlikedcellimageheight + vlikedcellspacing + vlikedcellbottompadding;
    
    return self;
}

#pragma mark -
#pragma mark layout

-(void)prepareLayout
{
    attrs = [NSMutableArray array];
    NSMutableArray *xoff = [NSMutableArray array];
    NSMutableArray *yoff = [NSMutableArray array];
    CGFloat columnwidth;
    CGFloat celwidth;
    CGFloat textwidth;
    NSUInteger columns;
    NSUInteger items = self.model.items.count;
    NSUInteger currentcol;
    totalwidth = self.collectionView.bounds.size.width;
    totalcellwidth = totalwidth - padding;
    totalheight = 0;
    
    if(totalwidth < 800)
    {
        columns = mincols;
    }
    else
    {
        columns = maxcols;
    }
    
    columnwidth = totalcellwidth / (CGFloat)columns;
    celwidth = columnwidth - padding;
    textwidth = celwidth - addedwidth;
    
    for(NSUInteger i = 0; i < columns; i++)
    {
        CGFloat addedpadding = 0;
        
        if(i)
        {
            addedpadding = padding;
        }
        
        [xoff addObject:@((i * columnwidth) + addedpadding)];
        [yoff addObject:@(padding)];
    }
    
    for(NSUInteger i = 0; i < items; i++)
    {
        mlikeditem *model = self.model.items[i];
        currentcol = i % columns;
        
        NSIndexPath *indexpath = [NSIndexPath indexPathForItem:i inSection:0];
        CGFloat height = [model heightforwidth:textwidth] + addedheight;
        CGFloat heightpadding = height + padding2;
        CGFloat x = [xoff[currentcol] floatValue];
        CGFloat y = [yoff[currentcol] floatValue];
        CGRect frame = CGRectMake(x, y, columnwidth, heightpadding);
        CGRect inset = CGRectInset(frame, padding_2, padding);
        CGFloat coly = y + heightpadding;
        
        UICollectionViewLayoutAttributes *attr = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexpath];
        [attr setFrame:inset];
        
        [attrs addObject:attr];
        totalheight = fmaxf(totalheight, coly);
        yoff[currentcol] = @(coly);
    }
    
    totalheight += 20;
}

-(CGSize)collectionViewContentSize
{
    CGSize size = CGSizeMake(totalwidth, totalheight);
    
    return size;
}

-(NSArray<UICollectionViewLayoutAttributes*>*)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *array = [NSMutableArray array];
    
    for(UICollectionViewLayoutAttributes *attr in attrs)
    {
        CGRect attrrect = attr.frame;
        if(CGRectIntersectsRect(attrrect, rect))
        {
            [array addObject:attr];
        }
    }
    
    return array;
}

@end