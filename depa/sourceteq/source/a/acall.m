#import "acall.h"

@implementation acall

-(instancetype)init:(id)variables
{
    self = [super init];
    
    self.variables = variables;
    self.post = NO;
    self.timeout = 25;
    self.keyforserver = @"server";
    self.keyforendpoint = @"";
    self.cachepolicy = NSURLRequestReloadIgnoringLocalCacheData;
    
    return self;
}

#pragma mark public

-(void)buildrequest
{
    NSString *filepath = [[NSBundle mainBundle] pathForResource:@"urlpar" ofType:@"plist"];
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
    NSURL *url;
    [urlstring appendString:self.server];
    [urlstring appendString:self.endpoint];
    [urlstring appendString:self.variables];
    url = [NSURL URLWithString:urlstring];
    
    if(self.post)
    {
        NSData *bodydata = 
        
        request = [NSMutableURLRequest requestWithURL:url cachePolicy:self.cachepolicy timeoutInterval:self.timeout];
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:[postvars dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO]];
    }
    else
    {
        
    }
    
    
    
    
    if(post)
    {
        request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:timeout];
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:[postvars dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:NO]];
    }
    else
    {
        request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:timeout];
    }
    
    return request;
}

@end