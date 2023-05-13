import 'package:comments/core/config/dio_catch_er_config.dart';
import 'package:comments/core/config/dio_config.dart';
import 'package:comments/data/model/comments_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class CommentsService {
  Future<dynamic> getComments() async {
    try {
      Response response = await DioConfig.createRequest()
          .get("https://jsonplaceholder.typicode.com/comments");
      if (response.statusCode == 200) {
        debugPrint(response.data);
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
