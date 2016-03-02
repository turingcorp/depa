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

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [[analytics singleton] trackscreen:ga_screen_contact];
}

-(void)loadView
{
    self.view = [[vitemcontactview alloc] init:self];
}

#pragma mark public

-(void)call
{
    NSString *rawphone = self.item.contactphone;
    
    rawphone = [rawphone stringByReplacingOccurrencesOfString:@" " withString:@""];
    rawphone = [rawphone stringByReplacingOccurrencesOfString:@"-" withString:@""];
    rawphone = [rawphone stringByReplacingOccurrencesOfString:@"/" withString:@""];
    rawphone = [rawphone stringByReplacingOccurrencesOfString:@"." withString:@""];
    rawphone = [rawphone stringByReplacingOccurrencesOfString:@"_" withString:@""];
    rawphone = [rawphone stringByReplacingOccurrencesOfString:@"," withString:@""];
    
    NSString *phone = [NSString stringWithFormat:@"tel:%@", rawphone];
    NSURL *url = [NSURL URLWithString:phone];
    [[UIApplication sharedApplication] openURL:url];
}

-(void)close
{
    [[cmain singleton] dismissViewControllerAnimated:YES completion:nil];
}

-(void)browse
{
    NSURL *url = [NSURL URLWithString:self.item.permalink];
    [[UIApplication sharedApplication] openURL:url];
}

@end