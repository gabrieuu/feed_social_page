import 'package:feed_social_page/modules/start/lib/model/comments.model.dart';
import 'package:feed_social_page/modules/start/lib/service/comments/i_comment_service.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'comment_controller.g.dart';

class CommentController = _CommentControllerBase with _$CommentController;

abstract class _CommentControllerBase with Store {

  @observable
  ObservableList<CommentsModel> comments = ObservableList.of([]);
  @observable
  bool commentsLoading = false;

  final commentTxt = TextEditingController();

  CommentService service;

  _CommentControllerBase(this.service);

  void getAllComments(int postId) async{
    List<CommentsModel> commentarios = await service.getComments(postId);
    comments.addAll(commentarios);
  }

  addComment(int postId) async{
    if(commentTxt.text != ""){
      final comment = CommentsModel(postId: postId, name: "Usuario", email: "usuario@.com", body: commentTxt.text);
      final response = await service.addComment(comment);
      comments.insert(0, response);
    }
    
  }

}