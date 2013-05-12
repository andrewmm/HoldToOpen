#import "MobileSafariHeader.h"
#import "ChromeHeader.h"

%group MobileSafari

    %hook BrowserToolbar

        %new
        - (void)holdToOpen:(UILongPressGestureRecognizer *)sender {
            if (sender.state == UIGestureRecognizerStateBegan) {
                Application *application = (Application *)[UIApplication sharedApplication];
                BrowserController *browserController = MSHookIvar<id>(application,"_controller");
                TabController *tabController = [browserController tabController];
                [self _tabExposeButtonPressed];
                PagedTabExposeView *tabExposeView = [tabController tabExposeView];
                NSArray *currentTabDocuments = [tabController.tabDocuments copy];
                [tabExposeView _newPageButtonPressed];
                for (TabDocument *tab in tabController.tabDocuments) {
                    if ([currentTabDocuments containsObject:tab])
                        continue;
                    tabExposeView.documentToActivate = tab;
                }
            }
        }

        - (id)initWithFrame:(struct CGRect)fp8 {
            %log;
            id ret = %orig;
            SpacedBarButtonItem *tabExposeItem = MSHookIvar<id>(self,"_tabExposeItem");
            UIView *tabButtonView = [tabExposeItem valueForKey:@"view"];
            UILongPressGestureRecognizer *recognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                                                                     action:@selector(holdToOpen:)];
            [tabButtonView addGestureRecognizer:recognizer];
            return ret;
        }

    %end

%end

%ctor {
    @autoreleasepool {
        if ([[[NSBundle mainBundle] bundleIdentifier] isEqualToString:@"com.apple.mobilesafari"]) {
            %init(MobileSafari);
        }
    }
}
