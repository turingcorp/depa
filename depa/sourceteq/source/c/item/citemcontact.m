#import "citemcontact.h"

@implementation citemcontact

+(void)show:(mitemdetail*)item
{
    citemcontact *controller = [[citemcontact alloc] init:item];
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
    
}

@end