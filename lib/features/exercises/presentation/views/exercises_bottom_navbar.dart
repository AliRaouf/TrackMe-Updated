import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:track_me_updated/constants.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/features/exercises/presentation/views/exercises_view.dart';
import 'package:track_me_updated/features/exercises/presentation/views/favorites_view.dart';
import 'package:track_me_updated/features/exercises/presentation/views/search_view.dart';

class ExerciseBottomNavBar extends StatefulWidget {
  const ExerciseBottomNavBar({super.key});

  @override
  State<ExerciseBottomNavBar> createState() => _ExerciseBottomNavBarState();
}

class _ExerciseBottomNavBarState extends State<ExerciseBottomNavBar> {
  final PersistentTabController _controller = PersistentTabController();
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).brightness == Brightness.dark
          ? exercisesLibraryDarkTheme
          : exercisesLibraryLightTheme,
      child: PopScope(
        onPopInvoked: (didPop) => context.pop(),
        child: PersistentTabView(
          gestureNavigationEnabled: true,
          controller: _controller,
          tabs: [
            PersistentTabConfig(
              screen: SearchView(
                onNavigate: _navigateToTab,
              ),
              item: ItemConfig(
                activeForegroundColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? kExerciseLibaryDark
                        : kExerciseLibaryLight,
                inactiveIcon: const Icon(Icons.search_outlined),
                icon: const Icon(Icons.search),
                title: "Search",
              ),
            ),
            PersistentTabConfig(
              screen: const ExercisesView(),
              item: ItemConfig(
                activeForegroundColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? kExerciseLibaryDark
                        : kExerciseLibaryLight,
                inactiveIcon: const Icon(Icons.fitness_center_outlined),
                icon: const Icon(Icons.fitness_center),
                title: "Exercises",
              ),
            ),
            PersistentTabConfig(
              screen: const FavoritesView(),
              item: ItemConfig(
                activeForegroundColor:
                    Theme.of(context).brightness == Brightness.dark
                        ? kExerciseLibaryDark
                        : kExerciseLibaryLight,
                inactiveIcon: const Icon(Icons.favorite_border),
                icon: const Icon(Icons.favorite),
                title: "Favorites",
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

  void _navigateToTab(int index) {
    _controller.jumpToTab(index);
  }
}
