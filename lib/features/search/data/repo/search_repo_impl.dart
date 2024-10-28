import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/search_model.dart';
import 'search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final SupabaseClient supabaseClient;

  SearchRepoImpl({required this.supabaseClient});

  @override
  Future<List<SearchModel>> getSearchData(String query) async {
    final res = await supabaseClient
        .from('profiles')
        .select()
        .ilike('name', '%$query%');
    return res.map((e) => SearchModel.fromJson(e)).toList();
  }
}
