#import "Safari.h"

%hook BrowserToolbar

- (id)initWithFrame:(struct CGRect)fp8 {
    %log;
    id ret = %orig;
    NSLog(@"cloud tabs = %@, tab expose = %@",_cloudTabsItem,_tabExposeItem);
    return ret;
}

%end
