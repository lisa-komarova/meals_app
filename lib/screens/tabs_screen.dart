import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/screens/categories_screen.dart';
import 'package:meals_app/screens/meals_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
  final List<Meal> _favouriteMeals = [];

  void _showInfoMessage(String message) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void _toggleMealFavouriteStatus(Meal meal) {
    var isExisting = _favouriteMeals.contains(meal);
    if (isExisting) {
      setState(() {
        _favouriteMeals.remove(meal);
        _showInfoMessage('Meal is no longer favourite!');
      });
    } else {
      setState(() {
        _favouriteMeals.add(meal);
        _showInfoMessage('Meal is favourite now!');
      });
    }
  }

  void _selectPage(index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = CategoriesScreen(
      onToggleFavourite: _toggleMealFavouriteStatus,
    );
    String activePageTitle = 'Categories';

    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        meals: _favouriteMeals,
        onToggleFavourite: _toggleMealFavouriteStatus,
      );
      activePageTitle = 'Favourite meals';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourites'),
        ],
        currentIndex: _selectedPageIndex,
        onTap: (index) {
          _selectPage(index);
        },
      ),
    );
  }
}
