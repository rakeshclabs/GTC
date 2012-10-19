//
//  InAppManager.h
//  Inapp1
//
//  Created by Samar Singla on 18/08/12.
//  Copyright (c) 2012 samarsingla@me.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StoreKit/StoreKit.h"



#define kProductsLoadedNotification         @"ProductsLoaded"
#define kProductPurchasedNotification       @"ProductPurchased"
#define kProductPurchaseFailedNotification  @"ProductPurchaseFailed"

@protocol InAppManagerDelegate <NSObject>
@required
-(void)InAppPurchaseFailed:(SKPaymentTransaction*)Transaction;
-(void)InAppPurchaseSuccessFull: (NSString *)ProductIdentifier;
-(void)InAppPurchaseProductLoaded:(NSArray *)Products ;

@end


@interface InAppManager : NSObject<SKProductsRequestDelegate,SKPaymentTransactionObserver,SKProductsRequestDelegate>{
    id<InAppManagerDelegate>_Delegate;
}
@property (nonatomic)NSArray  *Products;
@property (nonatomic)id<InAppManagerDelegate>Delegate;
+ (InAppManager *) sharedHelper;
- (void) RequestProductWithIdentifier:(NSSet *)AllProductIdentifires;
- (void) BuyProductAtIndex:(NSInteger)Index;
@end
