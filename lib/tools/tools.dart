Map<String, dynamic> getHighWordFrequency(String content) {
  List<String> contents = content.split(" ");

  Map<String, int> counter = {};

  for (String c in contents) {
    if (counter.containsKey(c)) {
      counter[c] = counter[c]! + 1;
    } else {
      counter[c] = 1;
    }
  }

  String word = "";
  int count = 0;

  counter.forEach((key, value) {
    if (value > count) {
      word = key;
      count = value;
    }
  });

  return {
    "word": word,
    "count": count,
  };
}
