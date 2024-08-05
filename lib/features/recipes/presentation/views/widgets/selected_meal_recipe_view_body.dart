import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/features/recipes/presentation/bloc/search_recipe_id/search_recipe_id_cubit.dart';
import 'package:track_me_updated/features/recipes/presentation/views/widgets/selected_recipe_view_body.dart';

class SelectedMealRecipeViewBody extends StatelessWidget {
  const SelectedMealRecipeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).brightness == Brightness.dark
          ? healthyRecipesDarkTheme
          : healthyRecipesLightTheme,
      child: BlocBuilder<SearchRecipeIdCubit, SearchRecipeIdState>(
        builder: (context, state) {
          if (state is SearchRecipeIdError) {
            return Scaffold(
              body: Center(child: Text(state.errMessage)),
            );
          } else if (state is SearchRecipeIdSuccess) {
            return Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text(state.recipe.title ?? ""),
              ),
              body: SelectedRecipeViewBody(recipeModel: state.recipe),
            );
          } else {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
        },
      ),
    );
  }
}
