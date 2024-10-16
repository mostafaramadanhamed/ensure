import 'package:ensure/core/network/auth_exception_handler.dart';
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

  // add post
  Future<void> addPost() async {
    emit(AddPostLoading());
    try {
     
      await postsUseCase.addPost(PostModel(
        text: textController.text,
        uId: hashCode,
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

  // get posts
  Future<void> getPosts() async {
    emit(GetPostsLoading());
    try {
      final posts = await postsUseCase.getPosts();
   
      emit(GetPostsSuccess(posts: posts));
    } catch (e) {
      emit(GetPostsError(
          SupanbaseExceptionHandler.parseException(e.toString()).message));
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
}
