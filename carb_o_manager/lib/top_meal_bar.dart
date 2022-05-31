import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'main.dart';

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
    int currentMealIndex = context.watch<MyAppModel>().selectedDailyLogIndex;
    int logLength = context.watch<MyAppModel>().dailyLogs.length;
    final bool isLeftArrowVisible = currentMealIndex > 0;
    final bool isRightArrowVisible = currentMealIndex < logLength - 1;
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
            left: 4,
            child: IconButton(
                onPressed: (() {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2200))
                      .then((value) =>
                          context.read<MyAppModel>().selectDate(value));
                }),
                splashRadius: 30,
                tooltip: 'Change log',
                icon: const Icon(
                  Icons.calendar_today_rounded,
                  color: Colors.grey,
                ))),
        Positioned(
          left: 50,
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Visibility(
                visible: isLeftArrowVisible,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: TextButton(
                    onPressed: context.read<MyAppModel>().selectPreviousMeal,
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    ))),
            Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  context.watch<MyAppModel>().selectedDailyLog.title,
                  style: const TextStyle(fontSize: 15),
                )),
            Visibility(
                visible: isRightArrowVisible,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: TextButton(
                    onPressed: context.read<MyAppModel>().selectNextMeal,
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.grey,
                    )))
          ]),
        )
      ],
    );
  }
}
