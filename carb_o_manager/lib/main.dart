/*
  Flutter Application for managing type 1 diabetes nutrition
*/
import 'package:carb_o_manager/food_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'meal_page.dart';
import 'ingredient_page.dart';
import 'health_page.dart';
import 'main_view.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (_) => MyAppModel(), child: const MyApp()));
}

class MyAppModel with ChangeNotifier {
  int selectedIndex = 0;
  int selectedDailyLogIndex = 0;
  late DailyMeal selectedDailyLog = dailyLogs[selectedDailyLogIndex];
  final List<Widget> pages = const [MealPage(), IngredientPage(), HealthPage()];
  late Widget currentPage = pages[selectedIndex];
  void selectTab(int index) {
    selectedIndex = index;
    currentPage = pages[index];
    notifyListeners();
  }

  List<DailyMeal> dailyLogs = [
    DailyMeal(title: 'Bad day', date: DateTime.now()),
    DailyMeal(title: 'Good day', date: DateTime.now())
  ];

  void openAccount() {}
  void addMeal() {}
  void selectNextMeal() {
    selectedDailyLogIndex++;
    selectedDailyLog = dailyLogs[selectedDailyLogIndex];
    notifyListeners();
  }

  void selectPreviousMeal() {
    selectedDailyLogIndex--;
    selectedDailyLog = dailyLogs[selectedDailyLogIndex];
    notifyListeners();
  }

  void selectDate(DateTime? date) {}
}

class MyApp extends StatelessWidget {
  static const List<BottomNavigationBarItem> bottomBarItems = [
    BottomNavigationBarItem(
        icon: Icon(Icons.food_bank_rounded),
        label: 'Meal',
        tooltip: 'Log meals here'),
    BottomNavigationBarItem(
        icon: Icon(Icons.shopping_basket_rounded),
        label: 'Ingredient',
        tooltip: 'Modify Ingredient Database'),
    BottomNavigationBarItem(
        icon: Icon(Icons.medical_services_rounded),
        label: 'Insulin',
        tooltip: 'Enter insulin data here')
  ];
  static const String applicationTitle = 'CarbOManager';
  static const Icon accountIcon = Icon(Icons.account_circle);
  static final ThemeData themeData = ThemeData(primarySwatch: Colors.blue);

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: applicationTitle,
      theme: themeData,
      home: const MainView(),
    );
  }
}
