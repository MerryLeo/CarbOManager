import 'package:flutter/material.dart';
import 'main.dart';
import 'package:provider/provider.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: context.watch<MyAppModel>().currentPage,
      bottomNavigationBar: BottomNavigationBar(
        items: MyApp.bottomBarItems,
        onTap: context.read<MyAppModel>().selectTab,
        currentIndex: context.watch<MyAppModel>().selectedIndex,
      ),
    );
  }
}
