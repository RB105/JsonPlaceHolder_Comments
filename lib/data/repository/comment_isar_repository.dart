import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:comments/data/model/comments_model.dart';
import 'package:comments/data/service/comments_service.dart';
import 'package:isar/isar.dart';

class CommentsRepository {
  //
  late Isar db;

  // instance
  CommentsService commentsService = CommentsService();

  Future<dynamic> getComments()async{
    db = await openIsar();
    if (await db.commentsModels.count() == 0) {
      return getRemote();
    } else {
      return await db.commentsModels.where().findAll();
    }
  }

  Future<dynamic> getRemote() async {
    return await commentsService.getComments().then((dynamic response)async {
      if (response is List<CommentsModel>) {
        print(response);
      await openIsar();
      await writeToDatabase(response);
      return db.commentsModels.where().findAll();
      } else {
        return response;
      }
    });
  }

  Future<Isar> openIsar() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([CommentsModelSchema], directory: appDocDir.path);
    } else {
      return await Future.value(Isar.getInstance());
    }
  }

  Future<void> writeToDatabase(List<CommentsModel> data)async{
    db.writeTxn(() async{
      await db.commentsModels.clear();
      await db.commentsModels.putAll(data); 
    });
  }
}
