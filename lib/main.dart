import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/core/app_router.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/features/theme/data/bloc/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeCubit.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => ThemeCubit())],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state.themeMode,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
