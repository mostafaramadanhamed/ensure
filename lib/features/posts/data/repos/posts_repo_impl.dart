import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/post_model.dart';
import 'posts_repo.dart';

class PostsRepoImpl implements PostsRepo {
  final SupabaseClient supabaseClient;

  PostsRepoImpl({required this.supabaseClient});

  @override
  Future<List<PostModel>> getPosts()async {
    final data= await supabaseClient.from('posts').select().order('created_at', ascending: false);
    debugPrint('data in repo impl : $data');
    return data.map((e) => PostModel.fromMap(e)).toList();
  }

  @override
  Future<List<PostModel>> getPostsByUserId(int userId) async{
  final data= await supabaseClient.from('posts').select().eq('author_id', userId);
  return data.map((e) => PostModel.fromMap(e)).toList();
  }


  @override
  Future<void> addPost(PostModel post)async {
   await supabaseClient.from('posts').insert({
    'author_name': supabaseClient.auth.currentUser?.userMetadata!['Display name'],
    'author_id': supabaseClient.auth.currentUser?.id,
    'text':post.text,
    'custom_id':post.uId,
    'content':post.content,
    'created_at': DateTime.now().toIso8601String(),
     'likes':post.likes,
     'comments':post.comments,
    },
  );
  }

  @override
  Future<void> updatePost(PostModel post) {
    return supabaseClient.from('posts').update(
      {
        'text':post.text,
        'content':post.content,
        'likes':post.likes,
        'comments':post.comments,
      }
    ).eq('custom_id',post.uId  );
  }

  @override 
  Future<void> deletePost(PostModel post) {
    return supabaseClient.from('posts').delete().eq('custom_id', post.uId);
  }
  
}