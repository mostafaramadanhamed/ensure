import 'dart:io';

import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/network/supabase_constants.dart';
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
  @override
  Future<void> addPost(PostModel post) async {
    await supabaseClient.from('posts').insert(
      {
        'author_name':
            supabaseClient.auth.currentUser?.userMetadata!['Display name'],
        'author_profile_pic':
            supabaseClient.auth.currentUser?.userMetadata!['profile_pic'],
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
  Future<void> deletePost(int postId) async {
    await supabaseClient.from('posts').delete().eq('custom_id', postId);
    await supabaseClient.from('likes').delete().eq('post_id', postId);

    await supabaseClient.from('comments').delete().eq('post_id', postId);

    try {
      await supabaseClient.storage
          .from(SupabaseConstants.profileBucket)
          .remove([
        'PostsPictures/${supabaseClient.auth.currentUser!.id}/$postId.png',
      ]);
    }
  catch (e) {
      debugPrint(e.toString());
    }
  }

    @override
    Future<int> likePost(int postId) async {
      final userId = supabaseClient.auth.currentUser?.id;
      await supabaseClient.from('likes').insert({
        'post_id': postId, // Use the generated post ID
        'user_id': userId, // Use the current user's ID
      });
      await supabaseClient.rpc('increment_likes', params: {'post_id': postId});
      final response = await supabaseClient
          .from('posts') // Assuming you have a 'posts' table
          .select('likes') // Adjust the column name if necessary
          .eq('custom_id', postId)
          .single();

      return response['likes'];
    }

    @override
    Future<int> unlikePost(int postId) async {
      final userId = supabaseClient.auth.currentUser?.id;
      await supabaseClient
          .from('likes')
          .delete()
          .eq('post_id', postId)
          .eq('user_id', userId.toString());

      await supabaseClient.rpc('decrement_likes', params: {'post_id': postId});

      final response = await supabaseClient
          .from('posts') // Assuming you have a 'posts' table
          .select('likes') // Adjust the column name if necessary
          .eq('custom_id', postId)
          .single();

      return response['likes'];
    }

    @override
    Future<bool> isPostLiked(int postId) async {
      final userId = supabaseClient.auth.currentUser?.id;
      final response = await supabaseClient
          .from('likes')
          .select('*')
          .eq('post_id', postId)
          .eq('user_id', userId.toString());
      return response.isNotEmpty;
    }

    @override
    Future<String> savePostPic(File profilePic, int postId) async {
      try {
        await supabaseClient.storage
            .from(SupabaseConstants.profileBucket)
            .upload(
                'PostsPictures/${supabaseClient.auth.currentUser!.id}/$postId',
                profilePic,
                fileOptions: const FileOptions(upsert: true));
        final response = supabaseClient.storage
            .from(SupabaseConstants.profileBucket)
            .getPublicUrl(
                'PostsPictures/${supabaseClient.auth.currentUser!.id}/$postId');
        return response;
      } catch (e) {
        throw Exception(e);
      }
    }
  }

