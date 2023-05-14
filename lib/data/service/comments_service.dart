import 'package:comments/core/config/dio_catch_er_config.dart';
import 'package:comments/core/config/dio_config.dart';
import 'package:comments/data/model/comments_model.dart';
import 'package:dio/dio.dart';
class CommentsService {
  Future<dynamic> getComments() async {
    try {
      Response response = await Dio()
          .get("https://jsonplaceholder.typicode.com/comments");
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => CommentsModel.fromJson(e))
            .toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return DioCatchError.catchError(e);
    }
  }
}
