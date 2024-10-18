import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/post_model.dart';
import 'posts_repo.dart';

class PostsRepoImpl implements PostsRepo {
  final SupabaseClient supabaseClient;

  PostsRepoImpl({required this.supabaseClient});

  @override
  Future<List<PostModel>> getPosts() async {
    final data = await supabaseClient
        .from('posts')
        .select()
        .order('created_at', ascending: false);
    return data.map((e) => PostModel.fromMap(e)).toList();
  }

  @override
  Future<List<PostModel>> getPostsByUserId(int userId) async {
    final data =
        await supabaseClient.from('posts').select().eq('author_id', userId);
    return data.map((e) => PostModel.fromMap(e)).toList();
  }

  @override
  Future<void> addPost(PostModel post) async {
    await supabaseClient.from('posts').insert(
      {
        'author_name':
            supabaseClient.auth.currentUser?.userMetadata!['Display name'],
        'author_profile_pic': supabaseClient.auth.currentUser?.userMetadata!['profile_pic'],
        'author_id': supabaseClient.auth.currentUser?.id,
        'text': post.text,
        'custom_id': post.uId,
        'content': post.content,
        'created_at': DateTime.now().toIso8601String(),
        'likes': post.likes,
        'comments': post.comments,
      },
    );
  }

  @override
  Future<void> updatePost(PostModel post) async {
    return await supabaseClient.from('posts').update({
      'text': post.text,
      'content': post.content,
      'likes': post.likes,
      'comments': post.comments,
    }).eq('custom_id', post.uId);
  }

  @override
  Future<void> deletePost(PostModel post) async {
    return await supabaseClient
        .from('posts')
        .delete()
        .eq('custom_id', post.uId);
  }

  @override
  

  @override
  Future<void> likePost(int postId) async {
    final userId = supabaseClient.auth.currentUser?.id;
    await supabaseClient.from('likes').insert({
      'post_id': postId, // Use the generated post ID
      'user_id': userId, // Use the current user's ID
    });
    await supabaseClient.rpc('increment_likes', params: {'post_id': postId});
   
  }

  @override
  Future<void> unlikePost(int postId) async {
    final userId = supabaseClient.auth.currentUser?.id;
    await supabaseClient
        .from('likes')
        .delete()
        .eq('post_id', postId)
        .eq('user_id', userId.toString());

    await supabaseClient.rpc('decrement_likes', params: {'post_id': postId});

  
  }
}
