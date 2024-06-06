import 'package:flutter/material.dart';

class CustomFooterWidget extends StatelessWidget {
  final bool noMoreItems;

  const CustomFooterWidget({super.key, required this.noMoreItems});

  @override
  Widget build(BuildContext context) {
    if (noMoreItems) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Text('No more items'),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
