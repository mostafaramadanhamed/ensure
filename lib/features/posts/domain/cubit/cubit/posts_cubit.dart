import 'package:ensure/core/network/auth_exception_handler.dart';
import 'package:ensure/features/posts/data/models/post_model.dart';
import 'package:ensure/features/posts/domain/cubit/cubit/posts_state.dart';
import 'package:ensure/features/posts/domain/use%20case/posts_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsUseCase postsUseCase;
  PostsCubit(this.postsUseCase) : super(PostsInitial());

 // add post 
  Future<void> addPost(PostModel post) async {
    emit(AddPostsLoading());
    try {
      await postsUseCase.addPost(post);
      emit(AddPostsSuccess());
    } catch (e) {
      emit(AddPostsError(SupanbaseExceptionHandler.parseException(e.toString()).message));
    }
  }

  // get posts
  Future<void> getPosts() async {
    emit(GetPostsLoading());
    try {
      final posts = await postsUseCase.getPosts();
      emit(GetPostsSuccess(posts: posts));
    } catch (e) {
      emit(GetPostsError(SupanbaseExceptionHandler.parseException(e.toString()).message));
    }
  }

  // get posts by user id
  Future<void> getPostsByUserId(int userId) async {
    emit(GetPostsLoading());
    try {
      final posts = await postsUseCase.getPostsByUserId(userId);
      emit(GetPostsSuccess(posts:posts));
    } catch (e) {
      emit(GetPostsError(SupanbaseExceptionHandler.parseException(e.toString()).message));
    }
  }

  // update post
  Future<void> updatePost(PostModel post) async {
    emit(UpdatePostsLoading());
    try {
      await postsUseCase.updatePost(post);
      emit(UpdatePostsSuccess());
    } catch (e) {
      emit(UpdatePostsError(SupanbaseExceptionHandler.parseException(e.toString()).message));
    }
  }

  // delete post
  Future<void> deletePost(PostModel post) async {
    emit(DeletePostsLoading());
    try {
      await postsUseCase.deletePost(post);
      emit(DeletePostsSuccess());
    } catch (e) {
      emit(DeletePostsError(SupanbaseExceptionHandler.parseException(e.toString()).message));
    }
  }
}
