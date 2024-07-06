import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_me_updated/core/app_router.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/core/utils/api_service.dart';
import 'package:track_me_updated/core/utils/simple_bloc_observer.dart';
import 'package:track_me_updated/features/recipes/data/repo/recipe_repo_implementation.dart';
import 'package:track_me_updated/features/recipes/presentation/bloc/fetch_recipes/fetch_recipes_cubit.dart';
import 'package:track_me_updated/features/theme/data/bloc/theme/theme_cubit.dart';

void main() async {
  BlocOverrides.runZoned(() async {
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, blocObserver: SimpleBlocObserver());
  await ThemeCubit.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ThemeCubit()),
          BlocProvider(
              create: (context) => FetchRecipesCubit(
                    RecipeRepoImplementation(
                      ApiService(
                        Dio(),
                      ),
                    ),
                  )..fetchRandomRecipes())
        ],
        child: ScreenUtilInit(
            designSize: const Size(360, 800),
            splitScreenMode: false,
            useInheritedMediaQuery: true,
            ensureScreenSize: true,
            builder: (_, child) {
              return BlocBuilder<ThemeCubit, ThemeState>(
                builder: (context, state) {
                  return MaterialApp.router(
                    routerConfig: AppRouter.router,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    themeMode: state.themeMode,
                    debugShowCheckedModeBanner: false,
                  );
                },
              );
            }));
  }
}
