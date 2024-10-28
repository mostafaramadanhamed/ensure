import 'package:ensure/features/search/domain/cubit/search_state.dart';
import 'package:ensure/features/search/domain/use%20case/search_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchUseCase searchUseCase;
  SearchCubit(this.searchUseCase) : super(SearchInitial());

  final TextEditingController searchController = TextEditingController();
  Future<void> getSearchData() async {
    emit(SearchLoading());
    try {
      if (searchController.text.isNotEmpty) {
        final result = await searchUseCase.call(searchController.text);
        emit(SearchLoaded(result));
      } else {
        emit(SearchInitial());
      }
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
