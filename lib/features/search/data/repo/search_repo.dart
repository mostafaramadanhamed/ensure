import '../models/search_model.dart';

abstract class SearchRepo {
  Future<List<SearchModel>> getSearchData(String query);
}