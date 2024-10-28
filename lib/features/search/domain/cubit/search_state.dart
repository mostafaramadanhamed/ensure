import '../../data/models/search_model.dart';

abstract class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchLoaded extends SearchState {
  final List<SearchModel> data;

  SearchLoaded(this.data);

}

final class SearchError extends SearchState {
  final String message;
  SearchError(this.message);
}