import 'package:flutter/material.dart';

class TopMealBar extends StatefulWidget implements PreferredSizeWidget {
  const TopMealBar({Key? key})
      : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  State<TopMealBar> createState() => _TopMealBarState();
}

class _TopMealBarState extends State<TopMealBar> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
