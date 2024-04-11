import 'package:flutter_test/flutter_test.dart';
import 'package:practice/testing_example/counter.dart';

void main(){
  group("Counter class - ", () {
    // Unit testing
    test(
      // description: given when then
      "given a counter class when it is instantiated then value of count should 0",
      (){
        // 1. Setup
        final Counter counter = Counter();
        // 2. Do
        final value = counter.count;
        // 3. Test
        expect(value, 0);
      },
    );
    // Unit testing
    test(
      // description: given when then
      "given a counter value when it is incremented then value of count should be 1",
      (){
        // 1. Setup
        final Counter counter = Counter();
        // 2. Do
        counter.incrementCount();
        final value = counter.count;
        // 3. Test
        expect(value, 1);
      },
    );
    test(
      // description: given when then
      "given a counter value when it is decremented then value of count should be -1",
      () {
        // 1. Setup
        final Counter counter = Counter();
        // 2. Do
        counter.decrementCount();
        final value = counter.count;
        // 3. Test
        expect(value, -1);
      },
    );
  });
}