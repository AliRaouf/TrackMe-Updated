import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_me_updated/features/workout/data/models/workout_plan_model.dart';
import 'package:track_me_updated/features/workout/data/repo/workout_repository.dart';

part 'workout_plan_state.dart';

class WorkoutPlanCubit extends Cubit<WorkoutPlanState> {
  final WorkoutRepository repository;
  WorkoutPlanCubit(this.repository) : super(WorkoutPlanInitial());
  Future<void> loadWorkoutPlans() async {
    emit(WorkoutPlanLoading());
    try {
      final plans = await repository.getWorkoutPlans();
      emit(WorkoutPlanSuccess(plans));
    } catch (e) {
      emit(const WorkoutPlanError("Failed to load workout plans"));
    }
  }

  Future<void> addWorkoutPlan(WorkoutPlan plan) async {
    emit(WorkoutPlanLoading());
    try {
      await repository.addWorkoutPlan(plan);
      final plans = await repository.getWorkoutPlans();
      emit(WorkoutPlanSuccess(plans));
    } catch (e) {
      emit(const WorkoutPlanError("Failed to add workout plan"));
    }
  }

  Future<void> updateWorkoutPlan(WorkoutPlan plan) async {
    emit(WorkoutPlanLoading());
    try {
      await repository.updateWorkoutPlan(plan);
      final plans = await repository.getWorkoutPlans();
      emit(WorkoutPlanSuccess(plans));
    } catch (e) {
      emit(const WorkoutPlanError("Failed to update workout plan"));
    }
  }

  Future<void> deleteWorkoutPlan(int id) async {
    emit(WorkoutPlanLoading());
    try {
      await repository.deleteWorkoutPlan(id);
      final plans = await repository.getWorkoutPlans();
      emit(WorkoutPlanSuccess(plans));
    } catch (e) {
      emit(const WorkoutPlanError("Failed to delete workout plan"));
    }
  }
}
