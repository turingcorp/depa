#import "citemlocation.h"

@class mitemdetail;

@implementation citemlocation

+(void)show:(mitemdetail*)item
{
    citemlocation *controller = [[citemlocation alloc] init:item];
    [[cmain singleton] presentViewController:controller animated:YES completion:nil];
}

-(instancetype)init:(mitemdetail*)item
{
    self = [super init];
    
    self.item = item;
    [self setModalPresentationStyle:UIModalPresentationOverCurrentContext];
    
    return self;
}

-(void)loadView
{
    self.view = [[vitemlocation alloc] init:self];
}

#pragma mark public

-(void)back
{
    [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
}

@end