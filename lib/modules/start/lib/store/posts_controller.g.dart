// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostController on _PostControllerBase, Store {
  late final _$postsAtom =
      Atom(name: '_PostControllerBase.posts', context: context);

  @override
  ObservableList<PostModel> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<PostModel> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$commentsLoadingAtom =
      Atom(name: '_PostControllerBase.commentsLoading', context: context);

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
posts: ${posts},
commentsLoading: ${commentsLoading}
    ''';
  }
}
