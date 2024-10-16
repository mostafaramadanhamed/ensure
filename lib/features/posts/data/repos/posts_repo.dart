import '../models/post_model.dart';

abstract class PostsRepo {

  Future<List<PostModel>> getPosts();

  Future<List<PostModel>> getPostsByUserId(int userId);

  Future<List<PostModel>> addPost(PostModel post);

  Future<List<PostModel>> updatePost(PostModel post);

  Future  <List<PostModel>> deletePost(PostModel post);
}