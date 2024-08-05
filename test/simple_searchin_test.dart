import 'package:simple_searching_flutter_algorithms/simple_searching_flutter_algorithms.dart';
import 'package:test/test.dart';

void main() {
  group('SearchAlgorithms', () {
    test('linear search finds the correct index and measures time', () {
      var list = [1, 2, 3, 4, 5];
      var result = SearchAlgorithms.linearSearch(list, 3);
      expect(result['index'], 2);
      expect(result['time'], isNonZero);
    });

    test('binary search finds the correct index and measures time', () {
      var list = [1, 2, 3, 4, 5];
      var result = SearchAlgorithms.binarySearch(list, 4);
      expect(result['index'], 3);
      expect(result['time'], isNonZero);
    });

    test('jump search finds the correct index and measures time', () {
      var list = [1, 2, 3, 4, 5];
      var result = SearchAlgorithms.jumpSearch(list, 5);
      expect(result['index'], 4);
      expect(result['time'], isNonZero);
    });
  });
}
