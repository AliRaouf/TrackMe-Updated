import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:track_me_updated/features/exercises/data/models/exercise_model/exercise_model.dart';
import 'package:track_me_updated/features/exercises/data/repo/exercise_repo.dart';

part 'get_exercise_state.dart';

class GetExerciseCubit extends Cubit<GetExerciseState> {
  GetExerciseCubit(this.exerciseRepo) : super(GetExerciseInitial());
  final ExerciseRepo exerciseRepo;

  Future<void> getExerciseBySearch({required String name}) async {
    emit(GetExerciseLoading());
    final result = await exerciseRepo.getExercisesBySearch(search: name);

    result.fold((l) => emit(GetExerciseError(l.errMessage)),
        (r) => emit(GetExerciseSuccess(r)));
  }

  Future<void> getExerciseByBodyPart({required String bodyPart}) async {
    emit(GetExerciseLoading());
    final result =
        await exerciseRepo.getExercisesByBodyPart(bodyPart: bodyPart);

    result.fold((l) => emit(GetExerciseError(l.errMessage)),
        (r) => emit(GetExerciseSuccess(r)));
  }

  Future<void> getExerciseByMuscle({required String targetMuscle}) async {
    emit(GetExerciseLoading());
    final result =
        await exerciseRepo.getExercisesByMuscle(targetMuscle: targetMuscle);

    result.fold((l) => emit(GetExerciseError(l.errMessage)),
        (r) => emit(GetExerciseSuccess(r)));
  }
}
