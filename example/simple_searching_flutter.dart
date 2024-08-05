import 'package:simple_searching_flutter_algorithms/simple_searching_flutter_algorithms.dart';

void main() {
  var list = [1, 2, 3, 4, 5];

  // Linear Search
  var linearResult = SearchAlgorithms.linearSearch(list, 3);
  print(
      'Linear Search: Index - ${linearResult['index']}, Time - ${linearResult['time']} microseconds');

  // Binary Search
  var binaryResult = SearchAlgorithms.binarySearch(list, 4);
  print(
      'Binary Search: Index - ${binaryResult['index']}, Time - ${binaryResult['time']} microseconds');

  // Jump Search
  var jumpResult = SearchAlgorithms.jumpSearch(list, 5);
  print(
      'Jump Search: Index - ${jumpResult['index']}, Time - ${jumpResult['time']} microseconds');
}
