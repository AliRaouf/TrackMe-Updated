import 'package:dartz/dartz.dart';
import 'package:track_me_updated/core/failures.dart';
import 'package:track_me_updated/features/exercises/data/models/exercise_model/exercise_model.dart';

abstract class ExerciseRepo {
  Future<Either<Failures, List<ExerciseModel>>> getExercisesBySearch(
      {required String search});
  Future<Either<Failures, List<ExerciseModel>>> getExercisesByBodyPart(
      {required String bodyPart});
  Future<Either<Failures, List<ExerciseModel>>> getExercisesByMuscle(
      {required String targetMuscle});
}
