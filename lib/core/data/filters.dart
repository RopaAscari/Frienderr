import 'package:flutter/material.dart';
import 'package:frienderr/features/presentation/widgets/fliter_selector.dart';

final colorFilters = List.generate(
  Colors.primaries.length,
  (index) => FilterSelectorItem<dynamic>(
      value: Colors.primaries[(index * 4) % Colors.primaries.length],
      display: "assets/images/none.png"),
);

final List<FilterSelectorItem<dynamic>> maskFilters = [
  "none",
  "aviators",
  "bigmouth",
  "lion",
  "dalmatian",
  "bcgseg",
  "look2",
  "fatify",
  "flowers",
  "grumpycat",
  "koala",
  "mudmask",
  "obama",
  "pug",
  "slash",
  "sleepingmask",
  "mallface",
  "teddycigar",
  "tripleface",
  "twistedface",
].map((e) {
  if (e == 'none') {
    return FilterSelectorItem<dynamic>(
        value: e, display: "assets/images/none.png");
  }
  return FilterSelectorItem<dynamic>(
      value: "assets/deep_ar/$e", display: "assets/images/$e.png");
}).toList();
