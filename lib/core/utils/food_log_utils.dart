import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/features/nutrition/data/models/food_log_model.dart';
import 'package:track_me_updated/features/nutrition/presentation/bloc/food_log/food_log_cubit.dart';

class FoodLogUtils {
  static int sumCalories(List<FoodLogModel> foodLogs) {
    int totalCalories = 0;
    for (var foodLog in foodLogs) {
      totalCalories += foodLog.calories ?? 0;
    }
    return totalCalories;
  }

  static int sumProtein(List<FoodLogModel> foodLogs) {
    int totalProtein = 0;
    for (var foodLog in foodLogs) {
      totalProtein += foodLog.protein ?? 0;
    }
    return totalProtein;
  }

  static int sumCarbs(List<FoodLogModel> foodLogs) {
    int totalCarbs = 0;
    for (var foodLog in foodLogs) {
      totalCarbs += foodLog.carbohydrates ?? 0;
    }
    return totalCarbs;
  }

  static int sumFiber(List<FoodLogModel> foodLogs) {
    int totalFiber = 0;
    for (var foodLog in foodLogs) {
      totalFiber += foodLog.fiber ?? 0;
    }
    return totalFiber;
  }

  static int sumFat(List<FoodLogModel> foodLogs) {
    int totalFat = 0;
    for (var foodLog in foodLogs) {
      totalFat += foodLog.fat ?? 0;
    }
    return totalFat;
  }

  static int sumIron(List<FoodLogModel> foodLogs) {
    int totalIron = 0;
    for (var foodLog in foodLogs) {
      totalIron += foodLog.fat ?? 0;
    }
    return totalIron;
  }

  static Widget buildNutritionIcon(int? value, Widget widget) {
    if (value == null || value == 0) {
      return const SizedBox.shrink();
    } else {
      return Row(
        children: [
          widget,
          Text("$value"),
          const SizedBox(width: 5),
        ],
      );
    }
  }

  static Widget buildTextField(String label, TextEditingController controller,
      TextInputType keyboardType) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }

  static Widget buildNumberField(
      String label, TextEditingController controller) {
    return buildTextField(label, controller, TextInputType.number);
  }

  static Widget buildDatePicker(BuildContext context, selectedDate) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Text(
            'Date: ${DateFormat('d/M/yyyy').format(selectedDate)}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }

  static void showDeleteDialog(BuildContext context, FoodLogModel foodLog) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Food Log'),
          content: const Text('Are you sure you want to delete this food log?'),
          actions: <Widget>[
            TextButton(
              child: Text(
                'Cancel',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Delete',
                style: TextStyles.cta18,
              ),
              onPressed: () {
                context.read<FoodLogCubit>().deleteFoodLog(foodLog);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
