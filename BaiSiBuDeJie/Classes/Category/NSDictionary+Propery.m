//
//  NSDictionary+Propery.m
//  runtime
//
//  Created by 刘 on 16/9/11.
//  Copyright © 2016年 刘. All rights reserved.
//

#import "NSDictionary+Propery.h"

@implementation NSDictionary (Propery)
//isKindOfClass先判断自己，再去判断是不是子类
//生成属性代码
-(void)createPropery{
    NSMutableString *codes = [[NSMutableString alloc]init];
//遍历字典
    
    [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull value, BOOL * _Nonnull stop) {
        NSLog(@"key%@",key);
       // @property (nonatomic,strong)NSString *value;
        NSString *code;
        
        if ([value isKindOfClass:[NSString class]]) {
        code = [NSString stringWithFormat:@"@property (nonatomic,strong)NSString *%@;",key];
        }
        //这里要把bool放在前面，因为他是nsnumber的子类。
        else if ([value isKindOfClass:NSClassFromString(@"__NSCFBoolean")]){
            
            code = [NSString stringWithFormat:@"@property (nonatomic,assign)BOOL %@;",key];
            
        }else if ([value isKindOfClass:[NSNumber class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic,assign)NSInteger %@;",key];

        }else if ([value isKindOfClass:[NSArray class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic,strong)NSArray *%@;",key];

        
        }else if ([value isKindOfClass:[NSDictionary class]]){
            code = [NSString stringWithFormat:@"@property (nonatomic,strong)NSDictionary *%@;",key];

        }
    
        [codes appendFormat:@"\n%@\n",code];
    }];
    NSLog(@"%@",codes);
}
@end
