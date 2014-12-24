@interface <#MyClass#> : <#MySuperClass#>
@property (assign,readwrite) <#MyPropertyClass#> *<#publicPropName1#>;
@end


@interface <#MyClass#> (){
    dispatch_queue_t _syncQueue<#PropName1#>;
    <#MyPropertyClass#> *_private<#PropName1#>;
}
@end

@implementation <#MyClass#>

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _syncQueue<#PropName1#> = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    }
    return self;
}

- (<#MyPropertyClass#> *)<#publicPropName1#>
{
    __block <#MyPropertyClass#> *local = nil;
    __weak <#MyClass#> *weakSelf = self;
    dispatch_sync(_syncQueue<#PropName1#>, ^{
        __strong <#MyClass#> *strongSelf = weakSelf;
        local = strongSelf->_private<#PropName1#>;
    });
    return local;
}

- (void)set<#PublicPropName1#>:(<#MyPropertyClass#> *)<#publicPropName1#>
{
    __weak <#MyClass#> *weakSelf = self;
    dispatch_barrier_async(_syncQueue<#PropName1#>, ^{
        __strong <#MyClass#> *strongSelf = weakSelf;
        strongSelf->_private<#PropName1#> = <#publicPropName1#>;
    });
}

@end
