import 'package:carb_o_manager/top_meal_bar.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:provider/provider.dart';

class MealPage extends StatelessWidget {
  const MealPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const TopMealBar(),
        body: const Center(
          child: Text('Hello Meal Page!'),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: context.read<MyAppModel>().addMeal));
  }
}
