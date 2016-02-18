#import "acall.h"

@implementation acall

-(instancetype)init:(NSString*)variables
{
    self = [super init];
    
    self.variables = variables;
    self.post = NO;
    self.keyforserver = @"server";
    self.keyforendpoint = @"";
    
    return self;
}

#pragma mark public

-(NSURLRequest*)request
{
    NSMutableURLRequest *request;
    NSMutableString *urlstring = [NSMutableString string];
    [urlstring appendString:self.server];
    [urlstring appendString:self.endpoint];
    [urlstring appendString:self.variables];
    
    if(self.post)
    {
        
    }
    else
    {
        
    }
    
    return request;
}

@end