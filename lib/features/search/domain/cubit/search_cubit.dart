

import 'package:ensure/features/search/domain/cubit/search_state.dart';
import 'package:ensure/features/search/domain/use%20case/search_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase searchUseCase;
  SearchCubit(this.searchUseCase) : super(SearchInitial());

  Future<void> getSearchData(String query) async {
    emit(SearchLoading());
    try {
      final result = await searchUseCase.call(query);
      emit(SearchLoaded(result));
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
