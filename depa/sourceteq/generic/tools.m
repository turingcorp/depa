#import "tools.h"

@implementation tools
{
    NSNumberFormatter *numformatter;
    NSNumberFormatter *priceformatter;
    CFStringRef stringref;
}

+(instancetype)singleton
{
    static tools *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

+(void)rateapp
{
    NSUserDefaults *properties = [NSUserDefaults standardUserDefaults];
    
    [[UIApplication sharedApplication] openURL:
     [NSURL URLWithString:[NSString stringWithFormat:@"itms-apps://itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@", [properties valueForKey:@"appid"]]]];
}

+(NSDictionary*)defaultdict
{
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"defs" withExtension:@"plist"]];
    
    return dictionary;
}

+(NSInteger)timestamp
{
    NSInteger now = [NSDate date].timeIntervalSince1970;
    
    return now;
}

+(UIImage*)qrcode:(NSString*)string
{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    [filter setValue:data forKey:@"inputMessage"];
    CIImage *ciimage = filter.outputImage;
    CIImage *scaleimage = [ciimage imageByApplyingTransform:CGAffineTransformMakeScale(10, 10)];
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgimage = [context createCGImage:scaleimage fromRect:scaleimage.extent];
    UIImage *uiimage = [UIImage imageWithCGImage:cgimage scale:1 orientation:UIImageOrientationUp];
    CFRelease(cgimage);
    
    return uiimage;
}

+(NSString*)cleanlatin:(NSString*)string
{
    NSString *str = [string stringByReplacingOccurrencesOfString:@"&ntilde;" withString:@"ñ"];
    str = [str stringByReplacingOccurrencesOfString:@"&Ntilde;" withString:@"Ñ"];
    str = [str stringByReplacingOccurrencesOfString:@"&aacute;" withString:@"á"];
    str = [str stringByReplacingOccurrencesOfString:@"&Aacute;" withString:@"Á"];
    str = [str stringByReplacingOccurrencesOfString:@"&eacute;" withString:@"é"];
    str = [str stringByReplacingOccurrencesOfString:@"&Eacute;" withString:@"É"];
    str = [str stringByReplacingOccurrencesOfString:@"&iacute;" withString:@"í"];
    str = [str stringByReplacingOccurrencesOfString:@"&Iacute;" withString:@"Í"];
    str = [str stringByReplacingOccurrencesOfString:@"&oacute;" withString:@"ó"];
    str = [str stringByReplacingOccurrencesOfString:@"&Oacute;" withString:@"Ó"];
    str = [str stringByReplacingOccurrencesOfString:@"&uacute;" withString:@"ú"];
    str = [str stringByReplacingOccurrencesOfString:@"&Uacute;" withString:@"Ú"];
    str = [str stringByReplacingOccurrencesOfString:@"&#34;" withString:@"\""];
    
    return str;
}

+(NSString*)cleanwhite:(NSString*)string
{
    NSString *str = [string stringByReplacingOccurrencesOfString:@"  " withString:@" "];
    str = [str stringByReplacingOccurrencesOfString:@"  " withString:@" "];
    str = [str stringByReplacingOccurrencesOfString:@"\n " withString:@"\n"];
    str = [str stringByReplacingOccurrencesOfString:@".\n" withString:@".\n\n"];
    str = [str stringByReplacingOccurrencesOfString:@". " withString:@".\n\n"];
    str = [str stringByReplacingOccurrencesOfString:@"\n\n\n\n" withString:@"\n\n"];
    str = [str stringByReplacingOccurrencesOfString:@"\n\n\n" withString:@"\n\n"];
    
    return str;
}

+(NSString*)capitalfirst:(NSString*)string
{
    NSMutableString *result = [NSMutableString string];
    NSArray *components = [string componentsSeparatedByString:@"."];
    NSUInteger count = components.count;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        NSString *instring = components[i];
        NSUInteger length = instring.length;
        
        if(i)
        {
            [result appendString:@"."];
        }
        
        if(length)
        {
            NSUInteger index = 0;
            
            for(NSUInteger j = 0; j < length; j++)
            {
                char c = [instring characterAtIndex:j];
                
                if((c >= 'A' && c <= 'Z') || (c >= 'a' && c <= 'z') || (c >= '0' && c <= '9'))
                {
                    index = j + 1;
                    j = length;
                }
            }
            
            NSString *rawprefix = [instring substringToIndex:index].uppercaseString;
            [result appendString:rawprefix];
            
            if(index < length)
            {
                NSString *rawsuffix = [instring substringFromIndex:index].lowercaseString;
                [result appendString:rawsuffix];
            }
        }
    }
    
    return result;
}

+(NSString*)removehtml:(NSString*)string
{
    NSMutableString *str = [NSMutableString string];
    NSUInteger count = string.length;
    
    for(NSUInteger i = 0; i < count; i++)
    {
        char c = [string characterAtIndex:i];
        
        if(c == '<')
        {
            for(++i; i < count; i++)
            {
                c = [string characterAtIndex:i];
                
                if(c == '>')
                {
                    break;
                }
            }
        }
        else
        {
            [str appendFormat:@"%c", c];
        }
    }
    
    NSString *strnochars = [str stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    strnochars = [strnochars stringByReplacingOccurrencesOfString:@"&deg;" withString:@"°"];
    
    return strnochars;
}

#pragma mark -

-(instancetype)init
{
    self = [super init];
    
    numformatter = [[NSNumberFormatter alloc] init];
    [numformatter setNumberStyle:NSNumberFormatterDecimalStyle];
    priceformatter = [[NSNumberFormatter alloc] init];
    [priceformatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    stringref = (CFStringRef)@"!*'();:@&=+$,/?%#[]";
    
    return self;
}

#pragma mark public

-(NSString*)urlencode:(NSString*)string
{
    NSString *newstring = (__bridge_transfer NSString*)CFURLCreateStringByAddingPercentEscapes(nil, (__bridge CFStringRef)string, nil, stringref, kCFStringEncodingUTF8);
    
    return newstring;
}

-(NSString*)numbertostring:(NSNumber*)number
{
    NSString *string = [numformatter stringFromNumber:number];
    
    return string;
}

-(NSString*)pricetostring:(NSNumber*)number currency:(NSString*)currency
{
    if([currency.lowercaseString isEqualToString:@"usd"])
    {
        [priceformatter setCurrencySymbol:@"USD $ "];
    }
    else
    {
        [priceformatter setCurrencySymbol:@"$ "];
    }
    
    NSString *string = [priceformatter stringFromNumber:number];
    
    return string;
}

-(NSNumber*)stringtonumber:(NSString*)string
{
    NSNumber *number = [numformatter numberFromString:string];
    
    return number;
}

@end