#import "appdel.h"
#import "mconfigsection.h"

@interface mconfig:NSObject

@property(strong, nonatomic)NSArray<mconfigsection*> *sections;

@end