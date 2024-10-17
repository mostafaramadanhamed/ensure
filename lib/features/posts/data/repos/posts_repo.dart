import '../models/post_model.dart';

abstract class PostsRepo {

  Future<List<PostModel>> getPosts();

  Future<List<PostModel>> getPostsByUserId(int userId);

  Future<void> addPost(PostModel post);

  Future<void> updatePost(PostModel post);

  Future  <void> deletePost(PostModel post);

  Future<String> getProfilePic(String authorId);

  Future<void> likePost(int postId);

  Future<void> unlikePost(int postId);
}