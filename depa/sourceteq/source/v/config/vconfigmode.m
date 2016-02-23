#import "vconfigmode.h"

@implementation vconfigmode

-(instancetype)init
{
    self = [super init];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:[UIColor clearColor]];
    [self setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UICollectionViewFlowLayout *flow = [[UICollectionViewFlowLayout alloc] init];
    
    UICollectionView *collection = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flow];
    [collection setBackgroundColor:[UIColor clearColor]];
    [collection setClipsToBounds:YES];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setDataSource:self];
    [collection setDelegate:self];
    [collection registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:celid];
    
    [self addSubview:collection];
    
    return self;
}

@end