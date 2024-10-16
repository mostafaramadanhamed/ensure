import '../../data/models/post_model.dart';
import '../../data/repos/posts_repo.dart';

class PostsUseCase {
  final PostsRepo postsRepo;

  PostsUseCase({required this.postsRepo});

  Future<List<PostModel>> getPosts() async {
    return postsRepo.getPosts();
  }

  Future<List<PostModel>> getPostsByUserId(int userId) async {
    return postsRepo.getPostsByUserId(userId);
  }

  Future<void> addPost(PostModel post) async {
    return postsRepo.addPost(post);
  }

  Future<void> updatePost(PostModel post) async {
    return postsRepo.updatePost(post);
  }

  Future<void> deletePost(PostModel post) async {
    return postsRepo.deletePost(post);
  } 
}