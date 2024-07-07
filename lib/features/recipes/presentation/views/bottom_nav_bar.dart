import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/features/recipes/presentation/views/favorite_recipes_view.dart';
import 'package:track_me_updated/features/recipes/presentation/views/recipes_view.dart';
import 'package:track_me_updated/features/recipes/presentation/views/meal_planner_view.dart';

class RecipeBottomNavBar extends StatelessWidget {
  const RecipeBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).brightness == Brightness.dark
          ? healthyRecipesDarkTheme
          : healthyRecipesLightTheme,
      child: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: const RecipesView(),
            item: ItemConfig(
              activeForegroundColor:
                  Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF106033)
                      : const Color(0xff3ACBBA),
              inactiveIcon: const Icon(Icons.menu_book_outlined),
              icon: const Icon(Icons.menu_book),
              title: "Recipes",
            ),
          ),
          PersistentTabConfig(
            screen: const MealPlannerView(),
            item: ItemConfig(
              activeForegroundColor:
                  Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF106033)
                      : const Color(0xff3ACBBA),
              inactiveIcon: const Icon(Icons.food_bank_outlined),
              icon: const Icon(Icons.food_bank),
              title: "Meal Plan",
            ),
          ),
          PersistentTabConfig(
            screen: const FavoriteRecipesView(),
            item: ItemConfig(
              activeForegroundColor:
                  Theme.of(context).brightness == Brightness.dark
                      ? const Color(0xFF106033)
                      : const Color(0xff3ACBBA),
              inactiveIcon: const Icon(Icons.favorite_border_outlined),
              icon: const Icon(Icons.favorite),
              title: "Favorite",
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style4BottomNavBar(
          navBarDecoration: NavBarDecoration(
              color: Theme.of(context).scaffoldBackgroundColor),
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
