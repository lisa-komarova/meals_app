import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, this.title, required this.meals, required this.onToggleFavourite});
  final String? title;
  final List<Meal> meals;
  final void Function(Meal) onToggleFavourite;
  void _selectMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => MealDetailsScreen(
              meal: meal,
              onToggleFavourite: onToggleFavourite,
            )));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = meals.isEmpty
        ? Center(
            child: Text(
              'No meals in this category',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            ),
          )
        : ListView.builder(
            itemCount: meals.length,
            itemBuilder: ((context, index) => MealItem(
                  meal: meals[index],
                  onSelectMeal: _selectMeal,
                )));

    if (title == null) return content;
    return Scaffold(
      appBar: AppBar(title: Text(title!)),
      body: content,
    );
  }
}
