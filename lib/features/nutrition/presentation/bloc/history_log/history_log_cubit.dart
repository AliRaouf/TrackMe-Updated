import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_me_updated/features/nutrition/data/models/food_log_model.dart';
import 'package:track_me_updated/features/nutrition/data/repo/food_log_repo.dart';

part 'history_log_state.dart';

class HistoryLogCubit extends Cubit<HistoryLogState> {
  final FoodLogRepo foodLogRepo;
  HistoryLogCubit(this.foodLogRepo) : super(HistoryLogInitial());
  Future<void> getFoodLogbyDate(String date) async {
    emit(HistoryLogLoading());
    try {
      final foodLogList = await foodLogRepo.getFoodLog(date);
      emit(HistoryLogSuccess(foodLogList));
    } catch (e) {
      emit(HistoryLogError(e.toString()));
    }
  }
}
