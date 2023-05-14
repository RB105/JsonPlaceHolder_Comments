import 'package:comments/data/model/comments_model.dart';
import 'package:comments/data/repository/comment_isar_repository.dart';
import 'package:flutter/material.dart';

class HomeProvider extends ChangeNotifier {
  HomeProvider() {
    getComments();
  }

  // instance
  CommentsRepository commentsRepository = CommentsRepository();

  // variables
  bool isLoading = false;
  String error = "";
  List<CommentsModel>? data;

  Future<void> getComments() async {
    isLoading = true;
    notifyListeners();
    await commentsRepository.getComments().then((dynamic response) {
      if (response is List<CommentsModel>) {
        data = response;
        isLoading = false ;
        notifyListeners();
      } else {
        error = response;
        isLoading= false;
        notifyListeners();
      }
    });
  }
}
