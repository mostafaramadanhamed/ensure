import '../../data/models/search_model.dart';
import '../../data/repo/search_repo.dart';

class SearchUseCase {
  final SearchRepo searchRepo;

  SearchUseCase({required this.searchRepo});

  Future<List<SearchModel>> call(String query) => searchRepo.getSearchData(query);
}