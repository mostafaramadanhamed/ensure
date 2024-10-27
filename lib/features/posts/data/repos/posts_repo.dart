import 'dart:io';

import '../models/post_model.dart';

abstract class PostsRepo {

  Future<List<PostModel>> getPosts();

  Future<List<PostModel>> getPostsByUserId(int userId);

  Future<void> addPost(PostModel post);

  Future<void> updatePost(PostModel post);

  Future  <void> deletePost(int postId);


  Future<int> likePost(int postId);

  Future<int> unlikePost(int postId);

  Future<bool> isPostLiked(int postId);

  Future<String> savePostPic( File postPic, int postId);

  //Future<void> setPostPic(int postId);

  // display user name and profile pic 
  Future<Map<String, dynamic>> getUserDetails();
  
  // logout
  Future<void> logout();
}