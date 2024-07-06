import 'package:dio/dio.dart';

class ApiService {
  final _recipeUrl = "https://api.spoonacular.com";
  final Dio dio;
  ApiService(this.dio);
  Future<Map<String, dynamic>> getRecipe(
      String endPoint, Map<String, dynamic>? queryParameters) async {
    var response =
        await dio.get('$_recipeUrl$endPoint', queryParameters: queryParameters);
    return response.data;
  }
}
