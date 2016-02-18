#import "acall.h"

@implementation acall

-(instancetype)init:(NSString*)variables
{
    self = [super init];
    
    self.variables = variables;
    self.post = NO;
    
    return self;
}

#pragma mark public

-(NSURLRequest*)request
{
    NSMutableURLRequest *request;
    NSMutableString *urlstring = [NSMutableString string];
    
    if(self.post)
    {
        
    }
    else
    {
        
    }
    
    return request;
}

@end