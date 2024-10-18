import 'package:ensure/core/network/auth_exception_handler.dart';
import 'package:ensure/core/utils/methods.dart';
import 'package:ensure/features/posts/data/models/post_model.dart';
import 'package:ensure/features/posts/domain/cubit/posts_state.dart';
import 'package:ensure/features/posts/domain/use%20case/posts_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsUseCase postsUseCase;
  PostsCubit(this.postsUseCase) : super(PostsInitial());

  final TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SupabaseClient supabaseClient = Supabase.instance.client;
  bool isLiked = false;

  // add post
  Future<void> addPost() async {
    emit(AddPostLoading());
    try {
      await postsUseCase.addPost(PostModel(
        profilePic:
            supabaseClient.auth.currentUser!.userMetadata!['profile_pic'],
        text: textController.text,
        authorId: supabaseClient.auth.currentUser!.id,
        uId: getCurrentTimeInMillis(),
        content: '',
        likes: 0,
        comments: 0,
        authorName:
            supabaseClient.auth.currentUser!.userMetadata!['Display name'],
        creatdAt: DateTime.now(),
      ));

      emit(AddPostSuccess());
    } catch (e) {
      emit(AddPostError(e.toString()));
    }
  }

// display user profile pic

  // get posts
  Future<void> getPosts() async {
    emit(GetPostsLoading());
    try {
      final posts = await postsUseCase.getPosts();

      emit(GetPostsSuccess(posts: posts));
    } catch (e) {
      debugPrint(e.toString());
      emit(GetPostsError(e.toString()));
    }
  }

  // get posts by user id
  Future<void> getPostsByUserId(int userId) async {
    emit(GetPostsLoading());
    try {
      final posts = await postsUseCase.getPostsByUserId(userId);
      emit(GetPostsSuccess(posts: posts));
    } catch (e) {
      emit(GetPostsError(
          SupanbaseExceptionHandler.parseException(e.toString()).message));
    }
  }

  // update post
  Future<void> updatePost(PostModel post) async {
    emit(UpdatePostLoading());
    try {
      await postsUseCase.updatePost(post);
      emit(UpdatePostSuccess());
    } catch (e) {
      emit(UpdatePostError(
          SupanbaseExceptionHandler.parseException(e.toString()).message));
    }
  }

  // delete post
  Future<void> deletePost(PostModel post) async {
    emit(DeletePostLoading());
    try {
      await postsUseCase.deletePost(post);
      emit(DeletePostSuccess());
    } catch (e) {
      emit(DeletePostError(
          SupanbaseExceptionHandler.parseException(e.toString()).message));
    }
  }

  // like post
  Future<void> likePost(int postId) async {
    try {
      await postsUseCase.likePost(postId);
      emit(LikePostSuccess());
      isLiked = true;
      await getPosts();
    } catch (e) {
      debugPrint(e.toString());
      emit(LikePostError(e.toString()));
    }
  }

  // unlike post
  Future<void> unlikePost(int postId) async {
    try {
      await postsUseCase.unlikePost(postId);
      emit(UnlikePostSuccess());
      isLiked = false;
      await getPosts();
    } catch (e) {
      debugPrint(e.toString());
      emit(UnlikePostError(e.toString()));
    }
  }
}
