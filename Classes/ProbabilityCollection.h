#import <Foundation/Foundation.h>

@interface ProbabilityCollection : NSObject

- (void)addObject:(NSObject *)object withProbability:(float)probability;
- (NSUInteger)count;
- (NSObject *)retrieveObject;
- (NSObject *)retrieveObjectUsingRandomFloat:(float)randomFloat;
- (NSObject *)retrieveAndRemoveObject;

@end