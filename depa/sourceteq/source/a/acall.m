#import "acall.h"

@implementation acall

-(instancetype)init:(NSString*)variables
{
    self = [super init];
    
    self.variables = variables;
    self.post = NO;
    self.timeout = 25;
    self.keyforserver = @"server";
    self.keyforendpoint = @"";
    
    return self;
}

#pragma mark public

-(void)buildrequest
{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"" ofType:@""];
    NSURL *fileurl = [NSURL fileURLWithPath:filepath];
    NSDictionary *params = [NSDictionary dictionaryWithContentsOfURL:fileurl];
    self.server = params[self.keyforserver];
    [self buildendpoint:params];
}

-(void)buildendpoint:(NSDictionary*)params
{
    self.endpoint = params[self.keyforendpoint];
}

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