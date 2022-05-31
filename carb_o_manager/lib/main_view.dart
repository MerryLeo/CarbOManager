import 'package:flutter/material.dart';
import 'main.dart';
import 'package:provider/provider.dart';

// Display pages and allow the
// user to navigate through pages
class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: context.read<MyAppModel>().openAccount,
          child: MyApp.accountIcon,
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
          ),
        ),
        title: const Text(MyApp.applicationTitle),
        centerTitle: true,
      ),
      body: context.watch<MyAppModel>().currentPage,
      bottomNavigationBar: BottomNavigationBar(
        items: MyApp.bottomBarItems,
        onTap: context.read<MyAppModel>().selectTab,
        currentIndex: context.watch<MyAppModel>().selectedIndex,
      ),
    );
  }
}
