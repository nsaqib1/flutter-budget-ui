import 'package:flutter/material.dart';

Color getColor(BuildContext context, double percent) {
  if (percent >= .50) {
    return Theme.of(context).colorScheme.primary;
  } else if (percent >= .25) {
    return Colors.orange;
  } else {
    return Colors.red;
  }
}
