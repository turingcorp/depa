#import <Foundation/Foundation.h>

@class amanager;

@protocol acalldelegate <NSObject>

-(void)callsuccess:(amanager*)manager;
-(void)call:(amanager*)manager error:(NSString*)error;

@end