import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen( {super.key, required this.title, required this.meals});
  final String title;
  final List<Meal> meals;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: meals.isEmpty
          ? Center(
              child:  Text('No meals in this category', style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
            )
          : ListView.builder(
            itemCount: meals.length,
              itemBuilder: ((context, index) => MealItem(meal: meals[index]))),
    );
  }
}
