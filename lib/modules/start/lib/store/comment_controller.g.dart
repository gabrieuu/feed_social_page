// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommentController on _CommentControllerBase, Store {
  late final _$commentsAtom =
      Atom(name: '_CommentControllerBase.comments', context: context);

  @override
  ObservableList<CommentsModel> get comments {
    _$commentsAtom.reportRead();
    return super.comments;
  }

  @override
  set comments(ObservableList<CommentsModel> value) {
    _$commentsAtom.reportWrite(value, super.comments, () {
      super.comments = value;
    });
  }

  late final _$commentsLoadingAtom =
      Atom(name: '_CommentControllerBase.commentsLoading', context: context);

  @override
  bool get commentsLoading {
    _$commentsLoadingAtom.reportRead();
    return super.commentsLoading;
  }

  @override
  set commentsLoading(bool value) {
    _$commentsLoadingAtom.reportWrite(value, super.commentsLoading, () {
      super.commentsLoading = value;
    });
  }

  @override
  String toString() {
    return '''
comments: ${comments},
commentsLoading: ${commentsLoading}
    ''';
  }
}
