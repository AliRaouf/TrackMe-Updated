import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'food_log_state.dart';

class FoodLogCubit extends Cubit<FoodLogState> {
  FoodLogCubit() : super(FoodLogInitial());
}
