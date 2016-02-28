#import "acall.h"
#import "aparser.h"

@implementation acall

-(instancetype)init:(id)variables
{
    self = [super init];
    
    self.variables = variables;
    self.post = NO;
    self.timeout = 18;
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
    self.endpoint = [NSString stringWithFormat:@"%@?", params[self.keyforendpoint]];
}

-(NSURLRequest*)request
{
    NSMutableURLRequest *request;
    NSMutableString *urlstring = [NSMutableString string];
    NSURL *url;
    [urlstring appendString:self.server];
    [urlstring appendString:self.endpoint];
    
    if(!self.post)
    {
        [urlstring appendString:self.variables];
    }
    
    url = [NSURL URLWithString:urlstring];
    request = [NSMutableURLRequest requestWithURL:url cachePolicy:self.cachepolicy timeoutInterval:self.timeout];
    
    if(self.post)
    {
        NSData *bodydata = [NSJSONSerialization dataWithJSONObject:self.variables options:0 error:nil];
        
        [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:bodydata];
    }
    
#warning "post url"
    
    NSLog(@"%@", urlstring);
    
    return request;
}

@end