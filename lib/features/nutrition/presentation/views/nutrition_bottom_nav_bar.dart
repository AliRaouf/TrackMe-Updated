import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:track_me_updated/constants.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/features/nutrition/presentation/views/history_log_view.dart';
import 'package:track_me_updated/features/nutrition/presentation/views/nutrition_view.dart';

class NutritionBottomNavBar extends StatelessWidget {
  const NutritionBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).brightness == Brightness.dark
          ? nutritionLogDarkTheme
          : nutritionLogLightTheme,
      child: PopScope(
        onPopInvoked: (didPop) => context.pop(),
        child: PersistentTabView(
          gestureNavigationEnabled: true,
          tabs: [
            PersistentTabConfig(
              screen: const NutritionView(),
              item: ItemConfig(
                activeForegroundColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? kNutritionLogDark
                        : kNutritionLogLight,
                inactiveIcon: const Icon(Icons.fastfood_outlined),
                icon: const Icon(Icons.fastfood),
                title: "Nutrition",
              ),
            ),
            PersistentTabConfig(
              screen: const HistoryLogView(),
              item: ItemConfig(
                activeForegroundColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? kNutritionLogDark
                        : kNutritionLogLight,
                inactiveIcon: const Icon(Icons.history_outlined),
                icon: const Icon(Icons.history),
                title: "History Log",
              ),
            ),
          ],
          navBarBuilder: (navBarConfig) => Style4BottomNavBar(
            navBarDecoration: NavBarDecoration(
                color: Theme.of(context).scaffoldBackgroundColor),
            navBarConfig: navBarConfig,
          ),
        ),
      ),
    );
  }
}
