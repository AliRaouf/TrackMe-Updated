import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_me_updated/features/nutrition/data/models/target_nutrition_model.dart';
import 'package:track_me_updated/features/nutrition/data/repo/target_nutrition_repo.dart';

part 'target_nutrition_state.dart';

class TargetNutritionCubit extends Cubit<TargetNutritionState> {
  final TargetNutritionRepo targetNutritionRepo;
  TargetNutritionCubit(this.targetNutritionRepo)
      : super(TargetNutritionInitial());

  Future<void> getTargetNutrition() async {
    emit(TargetNutritionLoading());
    try {
      final targetNutrition = await targetNutritionRepo.getTargetNutrition();
      emit(TargetNutritionSuccess(targetNutrition));
    } catch (e) {
      emit(TargetNutritionError(e.toString()));
    }
  }

  Future<void> updateTargetNutrition(
      int id, String columnName, int newValue) async {
    emit(TargetNutritionLoading());
    try {
      await targetNutritionRepo.updateTargetNutrition(id, columnName, newValue);
      final targetNutrition = await targetNutritionRepo.getTargetNutrition();
      emit(TargetNutritionSuccess(targetNutrition));
    } catch (e) {
      emit(TargetNutritionError(e.toString()));
    }
  }
}
