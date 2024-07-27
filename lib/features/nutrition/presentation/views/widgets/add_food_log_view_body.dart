import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:track_me_updated/core/styles.dart';
import 'package:track_me_updated/core/utils/food_log_utils.dart';
import 'package:track_me_updated/features/nutrition/data/models/food_log_model.dart';
import 'package:track_me_updated/features/nutrition/presentation/bloc/food_log/food_log_cubit.dart';

class AddFoodLogViewBody extends StatefulWidget {
  const AddFoodLogViewBody({super.key});

  @override
  State<AddFoodLogViewBody> createState() => _AddFoodLogViewBodyState();
}

class _AddFoodLogViewBodyState extends State<AddFoodLogViewBody> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _caloriesController = TextEditingController(text: "0");
  final _carbohydratesController = TextEditingController(text: "0");
  final _fatController = TextEditingController(text: "0");
  final _proteinController = TextEditingController(text: "0");
  final _fiberController = TextEditingController(text: "0");
  final _ironController = TextEditingController(text: "0");
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            FoodLogUtils.buildTextField(
                'Name', _nameController, TextInputType.text),
            FoodLogUtils.buildTextField(
                'Description', _descriptionController, TextInputType.text),
            FoodLogUtils.buildNumberField('Calories', _caloriesController),
            FoodLogUtils.buildNumberField('Protein', _proteinController),
            FoodLogUtils.buildNumberField(
                'Carbohydrates', _carbohydratesController),
            FoodLogUtils.buildNumberField('Fat', _fatController),
            FoodLogUtils.buildNumberField('Fiber', _fiberController),
            FoodLogUtils.buildNumberField('Iron', _ironController),
            FoodLogUtils.buildDatePicker(context, selectedDate),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text(
                'Add Food Log',
                style: TextStyles.body20Dark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final foodLog = FoodLogModel(
        name: _nameController.text,
        description: _descriptionController.text,
        calories: int.tryParse(_caloriesController.text),
        carbohydrates: int.tryParse(_carbohydratesController.text),
        fat: int.tryParse(_fatController.text),
        protein: int.tryParse(_proteinController.text),
        fiber: int.tryParse(_fiberController.text),
        iron: int.tryParse(_ironController.text),
        date: DateFormat('d/M/yyyy').format(selectedDate),
      );
      context.read<FoodLogCubit>().addFoodLog(foodLog);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _caloriesController.dispose();
    _carbohydratesController.dispose();
    _fatController.dispose();
    _proteinController.dispose();
    _fiberController.dispose();
    _ironController.dispose();
    super.dispose();
  }
}
