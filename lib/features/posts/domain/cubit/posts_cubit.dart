import 'dart:io';

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
  File? image;
  String? content;
  // save post pic
  Future<String> savePostPic({
    required File postPic,
  }) async {
    try {
      final response = await postsUseCase.savePostPic(
          postPic, getCurrentTimeInMillis(DateTime.now()));
      content = response;
      debugPrint(response.toString());
      debugPrint(content.toString());

      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  void selectImage(
    context,
  ) async {
    emit(ImagePickerLoading());
    image = await pickImageFromGallery(context);
    if (image != null) {
      await savePostPic(
        postPic: image!,
      );
      emit(ImagePickerSuccess(image: image!));
    }
    else {
      emit(ImagePickerError('No image selected'));
    }
  }

  // add post
  Future<void> addPost() async {
    emit(AddPostLoading());
    try {
      await postsUseCase.addPost(PostModel(
        profilePic:
            supabaseClient.auth.currentUser!.userMetadata!['profile_pic'],
        text: textController.text,
        authorId: supabaseClient.auth.currentUser!.id,
        uId: getCurrentTimeInMillis(DateTime.now()),
        content: content ?? '',
        likes: 0,
        comments: 0,
        authorName:
            supabaseClient.auth.currentUser!.userMetadata!['Display name'],
        creatdAt: DateTime.now(),
      ));
      textController.clear();
      image = null;

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
      getPosts();
    } catch (e) {
      emit(UpdatePostError(e.toString()));
    }
  }

// add popup menu for delete
  bool isuser(String userId) {
    return userId == supabaseClient.auth.currentUser!.id;
  }

  // delete post
  Future<void> deletePost(int postId) async {
    emit(DeletePostLoading());
    try {
      await postsUseCase.deletePost(postId);
      emit(DeletePostSuccess());
      getPosts();
    } catch (e) {
      emit(DeletePostError(
          SupanbaseExceptionHandler.parseException(e.toString()).message));
    }
  }

// logout
  Future<void> logout() async {
    emit(LogoutLoading());
    try {
      await postsUseCase.logout();
      emit(LogoutSuccess());
    } catch (e) {
      emit(LogoutError(e.toString()));
    }
  }

  // get user details
  Future<Map<String, dynamic>> getUserDetails() async {
    emit(GetUserDetailsLoading());
    try {
      final user = await postsUseCase.getUserDetails();
      final result = {
        'name': user['name'],
        'email': user['email'],
        'profile_pic': user['profile_pic'],
        'user_id': supabaseClient.auth.currentUser!.id,
      };
      emit(GetUserDetailsSuccess(user: result));
     
      return user;
    } catch (e) {
      emit(GetUserDetailsError(e.toString()));
      return {};
    }
  }

  // like post
  Future<void> likePostAndUpdateState(int postId) async {
    if (!await isPostLiked(postId)) {
      try {
        final updatedLikes = await postsUseCase.likePost(postId);
        emit(LikePostSuccess(updatedLikes, postId));
      } catch (error) {
        emit(LikePostError(error.toString()));
        // Handle error if necessary
      }
    }
  }

  // unlike post
  Future<void> unlikePost(int postId) async {
    if (await isPostLiked(postId)) {
      try {
        final updatedLikes = await postsUseCase.unlikePost(postId);
        emit(UnlikePostSuccess(updatedLikes, postId));
      } catch (error) {
        emit(UnlikePostError(error.toString()));
        // Handle error if necessary
      }
    }
  }

  Future<bool> isPostLiked(int postId) async {
    try {
      final response = await postsUseCase.isPostLiked(postId);
      debugPrint(response.toString());
      emit(IsPostLikedSuccess(response, postId));
      return response;
    } catch (e) {
      
      emit(IsPostLikedError(e.toString()));
      return false;
    }
  }
}
