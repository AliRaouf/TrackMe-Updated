import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:track_me_updated/core/failures.dart';
import 'package:track_me_updated/core/utils/api_service.dart';
import 'package:track_me_updated/features/exercises/data/models/exercise_model/exercise_model.dart';
import 'package:track_me_updated/features/exercises/data/repo/exercise_repo.dart';

class ExerciseRepoImplementation implements ExerciseRepo {
  final ApiService apiService;
  ExerciseRepoImplementation(this.apiService);
  @override
  Future<Either<Failures, List<ExerciseModel>>> getExercisesBySearch(
      {required String search}) async {
    try {
      var data = await apiService
          .getExercise('/exercises/name/$search', {'limit': '20'});
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<ExerciseModel>>> getExercisesByMuscle(
      {required String targetMuscle}) async {
    try {
      var data = await apiService
          .getExercise('/exercises/target/$targetMuscle', {'limit': '20'});
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failures, List<ExerciseModel>>> getExercisesByBodyPart(
      {required String bodyPart}) async {
    try {
      var data = await apiService
          .getExercise('/exercises/bodyPart/$bodyPart', {'limit': '20'});
      return right(data);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
