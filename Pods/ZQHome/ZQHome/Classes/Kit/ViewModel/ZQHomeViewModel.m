//
//  ZQHomeViewModel.m
//  ZQHome
//
//  Created by LY on 2023/8/18.
//

#import "ZQHomeViewModel.h"
#import "ZQHomeListModel.h"

@implementation ZQHomeViewModel

- (instancetype)init {
    self = [super init];
        if (self) {
            _itemArray = [NSMutableArray array];
        }
        return self;
}

- (void)loadMoreWithCompletion:(void(^)(void))completion {

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           NSInteger itemCount = self.itemArray.count;
           for (NSInteger i = itemCount; i < itemCount + 20; i++) {
               ZQHomeListModel *item = [[ZQHomeListModel alloc] init];
               item.title = [NSString stringWithFormat:@"Item %ld", i];
               [self.itemArray addObject:item];
           }

           if (completion) {
               completion();
           }
       });


}

- (void)loadNewDateWithCompletion:(void(^)(void))completion {
    [self.itemArray removeAllObjects];

       dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
           for (NSInteger i = 0; i < 20; i++) {
               ZQHomeListModel *item = [[ZQHomeListModel alloc] init];
               item.title = [NSString stringWithFormat:@"Item %ld", i];
               [self.itemArray addObject:item];
           }

           if (completion) {
               completion();
           }
       });
}

@end
