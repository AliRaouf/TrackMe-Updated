import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/core/widgets/animated_search_bar.dart';
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
    return Scaffold(
      appBar: AppBar(
        leadingWidth: double.infinity,
        leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: AnimatedSearchBar(
              expanded: false,
              textController: textController,
              onSubmitted: (query) async {
                if (query.isNotEmpty) {
                  await context
                      .read<FetchRecipesCubit>()
                      .fetchSearchRecipes(query: query);
                }
              },
              width: MediaQuery.sizeOf(context).width,
            )),
      ),
      body: BlocBuilder<FetchRecipesCubit, FetchRecipesState>(
        builder: (context, state) {
          return const RecipeViewBody();
        },
      ),
    );
  }
}
