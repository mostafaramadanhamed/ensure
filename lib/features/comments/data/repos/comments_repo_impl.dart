import 'package:ensure/features/comments/data/repos/comments_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/comment_model.dart';

class CommentsRepoImpl implements CommentsRepo {
  final SupabaseClient supabaseClient;

  CommentsRepoImpl({required this.supabaseClient});

  @override
  Future<List<CommentModel>> getComments(int postId) async {
    final response = await supabaseClient
        .from('comments')
        .select('*')
        .eq('post_id', postId)
        .order('created_at', ascending: true);
    return response
        .map((e) => CommentModel.fromMap(e))
        .toList();
  }

  @override
  Future<void> addComment(CommentModel comment) async {
    await supabaseClient.from('comments').insert(
      {
        'post_id': comment.postId,
        'comment_id': comment.commentId,
        'author_id': supabaseClient.auth.currentUser!.id,
        'content': comment.content,
        'created_at': DateTime.now().toIso8601String(),
        'author_name':supabaseClient.auth.currentUser!.userMetadata!['Display name'],
        'author_profile_pic': supabaseClient.auth.currentUser!.userMetadata!['profile_pic'],
      },
    );
  }

  @override
  Future<void> deleteComment(CommentModel comment) async {
    //await supabaseClient.from('comments').delete().eq('id', comment.id);
  }
}