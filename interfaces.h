@class SpacedBarButtonItem;
@class TabDocument;

@interface BrowserToolbar : UIToolbar {
    SpacedBarButtonItem* _cloudTabsItem;
    SpacedBarButtonItem* _tabExposeItem;
}

- (id)initWithFrame:(struct CGRect)fp8;
- (void)setTabExposeItem:(id)item;
- (void)_tabExposeButtonPressed;
@end

@interface SpacedBarButtonItem : UIBarButtonItem {
    UIBarButtonItem* _precedingFixedSpace;
}
@property(readonly, assign, nonatomic) UIBarButtonItem* precedingFixedSpace;
- (void)dealloc;
- (id)init;
@end

@interface PagedTabExposeView {
    NSMutableArray* _tabDocuments;
}
@property(retain, nonatomic) TabDocument* documentToActivate;
- (void)_newPageButtonPressed;
-(void)scrollToDocument:(id)document;
-(void)animateAddNewTabDocument:(id)document;
@end

@interface BrowserController
- (id)tabController;
-(void)switchFromTabDocument:(id)tabDocument toTabDocument:(id)tabDocument2 inBackground:(BOOL)background;
@end

@interface Application : UIApplication {
    BrowserController* _controller;
}
@end

@interface TabController
@property(readonly, assign, nonatomic) PagedTabExposeView* tabExposeView;
@property(retain, nonatomic) TabDocument* activeTabDocument;
@property(readonly, assign, nonatomic) NSArray* tabDocuments;
- (void)_newPageButtonPressed;
-(void)setActiveTabDocument:(id)document animated:(BOOL)animated;
-(void)tabExposeView:(id)view didHideWithActiveTabDocument:(id)activeTabDocument;
-(void)tabExposeView:(id)view activateTabDocument:(id)document;
- (BOOL)_createAndSwitchToNewBlankTabDocumentOpeningCaptiveLandingPageIfNecessary;
- (id)_openBlankTabDocument;
@end

