import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:track_me_updated/features/nutrition/data/models/food_log_model.dart';
import 'package:track_me_updated/features/nutrition/data/repo/food_log_repo.dart';

part 'food_log_state.dart';

class FoodLogCubit extends Cubit<FoodLogState> {
  final FoodLogRepo foodLogRepo;
  FoodLogCubit(this.foodLogRepo) : super(FoodLogInitial());
  Future<void> addFoodLog(FoodLogModel foodLog) async {
    emit(FoodLogLoading());
    try {
      await foodLogRepo.addFoodLog(foodLog);
      final foodLogList = await foodLogRepo
          .getFoodLog(DateFormat('d/M/yyyy').format(DateTime.now()));
      emit(FoodLogSuccess(foodLogList));
    } catch (e) {
      emit(FoodLogError(e.toString()));
    }
  }

  Future<void> updateFoodLog(FoodLogModel foodLog) async {
    emit(FoodLogLoading());
    try {
      await foodLogRepo.updateFoodLog(foodLog);
      final foodLogList = await foodLogRepo
          .getFoodLog(DateFormat('d/M/yyyy').format(DateTime.now()));
      emit(FoodLogSuccess(foodLogList));
    } catch (e) {
      emit(FoodLogError(e.toString()));
    }
  }

  Future<void> deleteFoodLog(FoodLogModel foodLog) async {
    emit(FoodLogLoading());
    try {
      await foodLogRepo.deleteFoodLog(foodLog);
      final foodLogList = await foodLogRepo
          .getFoodLog(DateFormat('d/M/yyyy').format(DateTime.now()));
      emit(FoodLogSuccess(foodLogList));
    } catch (e) {
      emit(FoodLogError(e.toString()));
    }
  }

  Future<void> getFoodLog() async {
    emit(FoodLogLoading());
    try {
      final foodLogList = await foodLogRepo
          .getFoodLog(DateFormat('d/M/yyyy').format(DateTime.now()));
      emit(FoodLogSuccess(foodLogList));
    } catch (e) {
      emit(FoodLogError(e.toString()));
    }
  }
}
