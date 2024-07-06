import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/core/utils/api_service.dart';
import 'package:track_me_updated/core/widgets/animated_search_bar.dart';
import 'package:track_me_updated/features/recipes/data/repo/recipe_repo_implementation.dart';
import 'package:track_me_updated/features/recipes/presentation/bloc/fetch_recipes/fetch_recipes_cubit.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/recipe_view_body.dart';

class RecipesView extends StatefulWidget {
  const RecipesView({super.key});

  @override
  State<RecipesView> createState() => _RecipesViewState();
}

class _RecipesViewState extends State<RecipesView> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var cubit = FetchRecipesCubit(RecipeRepoImplementation(ApiService(Dio())));
    return Theme(
      data: Theme.of(context).brightness == Brightness.dark
          ? healthyRecipesDarkTheme
          : healthyRecipesLightTheme,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: double.infinity,
          leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: AnimatedSearchBar(
                textController: textController,
                onSubmitted: (query) async {
                  if (query.isNotEmpty) {
                    await context
                        .read<FetchRecipesCubit>()
                        .fetchSearchRecipes(query: query);
                    setState(() {});
                  }
                },
              )),
        ),
        body: BlocBuilder<FetchRecipesCubit, FetchRecipesState>(
          builder: (context, state) {
            return const RecipeViewBody();
          },
        ),
      ),
    );
  }
}
