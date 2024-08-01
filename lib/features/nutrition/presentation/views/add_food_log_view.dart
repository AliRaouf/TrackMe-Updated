import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/core/theme/themes.dart';
import 'package:track_me_updated/features/nutrition/presentation/bloc/food_log/food_log_cubit.dart';
import 'package:track_me_updated/features/nutrition/presentation/views/widgets/add_food_log_view_body.dart';

class AddFoodLogView extends StatelessWidget {
  const AddFoodLogView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodLogCubit, FoodLogState>(
      listener: (context, state) {
        if (state is FoodLogSuccess) {
          Navigator.pop(context);
        } else if (state is FoodLogError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      child: Theme(
        data: Theme.of(context).brightness == Brightness.dark
            ? nutritionLogDarkTheme
            : nutritionLogLightTheme,
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'Add Food Log',
                style: TextStyles.title22Dark,
              ),
              centerTitle: true,
            ),
            body: const AddFoodLogViewBody()),
      ),
    );
  }
}
