#import "vplaymenu.h"

@implementation vplaymenu

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
    [collection setTranslatesAutoresizingMaskIntoConstraints:NO];
    [collection setDelegate:self];
    [collection setDataSource:self];
    [collection setScrollEnabled:NO];
    [collection setBounces:NO];
    [collection setBackgroundColor:[UIColor clearColor]];
    self.collection = collection;
    
    return self;
}

@end