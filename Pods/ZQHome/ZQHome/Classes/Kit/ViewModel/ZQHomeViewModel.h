//
//  ZQHomeViewModel.h
//  ZQHome
//
//  Created by LY on 2023/8/18.
//

#import <Foundation/Foundation.h>
@class ZQHomeListModel;

NS_ASSUME_NONNULL_BEGIN

@interface ZQHomeViewModel : NSObject
@property (nonatomic, strong) NSMutableArray<ZQHomeListModel *> *itemArray;

- (void)loadMoreWithCompletion:(void(^)(void))completion;
- (void)loadNewDateWithCompletion:(void(^)(void))completion;
@end

NS_ASSUME_NONNULL_END
