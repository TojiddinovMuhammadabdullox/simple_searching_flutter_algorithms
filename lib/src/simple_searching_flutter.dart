import 'dart:math';

void main() {
  // Sample list of strings to search within.
  List<String> data = [
    'apple',
    'banana',
    'cherry',
    'date',
    'fig',
    'grape',
    'kiwi'
  ];

  // The term we are searching for.
  String searchTerm = 'cherry';

  // Perform and measure the time for Linear Search.
  print('Linear Search:');
  measureTime(() {
    int result = linearSearch(data, searchTerm);
    print('Result: $result');
  });

  // Perform and measure the time for Binary Search.
  print('Binary Search:');
  measureTime(() {
    int result = binarySearch(data, searchTerm);
    print('Result: $result');
  });

  // Perform and measure the time for Jump Search.
  print('Jump Search:');
  measureTime(() {
    int result = jumpSearch(data, searchTerm);
    print('Result: $result');
  });
}

// Function to measure and print the execution time of a search function.
void measureTime(Function func) {
  final stopwatch = Stopwatch()..start(); // Start the stopwatch.
  func(); // Execute the search function.
  stopwatch.stop(); // Stop the stopwatch.
  print(
      'Time: ${stopwatch.elapsedMicroseconds} µs'); // Print the elapsed time in microseconds.
}

// Linear Search function.
// Returns the index of the search term if found, otherwise returns -1.
int linearSearch(List<String> data, String searchTerm) {
  for (int i = 0; i < data.length; i++) {
    if (data[i] == searchTerm) {
      return i;
    }
  }
  return -1; // Return -1 if the term is not found.
}

// Binary Search function.
// Assumes the list is sorted. Returns the index of the search term if found, otherwise returns -1.
int binarySearch(List<String> data, String searchTerm) {
  int low = 0;
  int high = data.length - 1;

  while (low <= high) {
    int mid = (low + high) ~/ 2; // Calculate the middle index.
    if (data[mid] == searchTerm) {
      return mid; // Return the index if the term is found.
    } else if (data[mid].compareTo(searchTerm) < 0) {
      low = mid + 1; // Search in the right half.
    } else {
      high = mid - 1; // Search in the left half.
    }
  }
  return -1; // Return -1 if the term is not found.
}

// Jump Search function.
// Assumes the list is sorted. Returns the index of the search term if found, otherwise returns -1.
int jumpSearch(List<String> data, String searchTerm) {
  int n = data.length;
  int step = sqrt(n).toInt(); // Determine the optimal jump step.
  int prev = 0;

  // Finding the block where the element is present (if it is present).
  while (data[min(step, n) - 1].compareTo(searchTerm) < 0) {
    prev = step;
    step += sqrt(n).toInt();
    if (prev >= n) {
      return -1; // Return -1 if the term is not found within the list.
    }
  }

  // Linear search within the identified block.
  while (data[prev].compareTo(searchTerm) < 0) {
    prev++;
    if (prev == min(step, n)) {
      return -1; // Return -1 if the term is not found within the block.
    }
  }

  // If the element is found.
  if (data[prev] == searchTerm) {
    return prev;
  }

  return -1; // Return -1 if the term is not found.
}
