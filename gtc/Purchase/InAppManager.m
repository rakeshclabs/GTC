//
//  InAppManager.m
//  Inapp1
//
//  Created by Samar Singla on 18/08/12.
//  Copyright (c) 2012 samarsingla@me.com. All rights reserved.
//

#import "InAppManager.h"

@implementation InAppManager
static InAppManager * _sharedHelper;

@synthesize Products;
@synthesize Delegate=_Delegate;
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
            default:
                break;
        }
    }
}


- (void) completeTransaction: (SKPaymentTransaction *)transaction
{
    // Your application should implement these two methods.
    [self recordTransaction:transaction];
    [self provideContent:transaction.payment.productIdentifier];
    
    // Remove the transaction from the payment queue.
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}


- (void) failedTransaction: (SKPaymentTransaction *)transaction
{
    if (transaction.error.code != SKErrorPaymentCancelled) {
        // Optionally, display an error here.
    }
   // [[NSNotificationCenter defaultCenter] postNotificationName:kProductPurchaseFailedNotification object:transaction];
    [_Delegate InAppPurchaseFailed:transaction];
    
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];

}

- (void) restoreTransaction: (SKPaymentTransaction *)transaction
{
    [self recordTransaction: transaction];
    [self provideContent: transaction.originalTransaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}


- (void)recordTransaction:(SKPaymentTransaction *)transaction {   
    NSLog(@"record on server=%@",transaction.payment.productIdentifier); 
    
    // Record the transaction on the server side...    
}

- (void)provideContent:(NSString *)productIdentifier {
    
    [_Delegate InAppPurchaseSuccessFull:productIdentifier];
 //   [[NSNotificationCenter defaultCenter] postNotificationName:kProductPurchasedNotification object:productIdentifier];
    
}





+ (InAppManager *) sharedHelper {
    
    if (_sharedHelper != nil) {
        return _sharedHelper;
    }
    _sharedHelper = [[InAppManager alloc] init];
    return _sharedHelper;
    
}


- (void) RequestProductWithIdentifier:(NSSet *)AllProductIdentifires
{
    SKProductsRequest *request= [[SKProductsRequest alloc] initWithProductIdentifiers:
                                 AllProductIdentifires];
    request.delegate = self;
    [request start];
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
    Products =response.products;
    NSLog(@"product response=%@",Products);
    
    [_Delegate InAppPurchaseProductLoaded:Products];
   // [[NSNotificationCenter defaultCenter] postNotificationName:kProductsLoadedNotification object:Products];    

    
}


-(void)BuyProductAtIndex:(NSInteger)Index{
    if([InAppManager sharedHelper].Products.count>0)
    {
        SKProduct *Product=[[InAppManager sharedHelper].Products objectAtIndex:Index];
        NSLog(@"bying.. %@",Product.productIdentifier);
        SKPayment *payment = [SKPayment paymentWithProduct:Product ];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    }
    else {
        NSLog(@"No product found");
    }
}
@end
