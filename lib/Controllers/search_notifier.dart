

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:victous/State/search_state.dart';


final SearchProvider = StateNotifierProvider<SearchNotifier, SearchState>((ref) => SearchNotifier());

class SearchNotifier extends StateNotifier<SearchState> {
  SearchNotifier() : super(const SearchState(''));

  void set(String q) => state = SearchState(q);
  void clear() => state = const  SearchState('');
}

final filteredListProvider = Provider.family<List<dynamic>, List<dynamic>>((ref, list) {
  final q = ref.watch(SearchProvider).query.toLowerCase();

  if (q.isEmpty) return list;

  return list.where((e) => e.toString().toLowerCase().contains(q)).toList();
});
