import 'package:equatable/equatable.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:waitech/models/categor_filter_model.dart';

import '../../models/filter_model.dart';
import '../../models/price_filter_model.dart';

part 'filter_event.dart';

part 'filter_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersLoading());

  @override
  Stream<FiltersState> mapEventToState(
    FiltersEvent event,
  ) async* {
    if (event is FilterLoad) {
      yield* _mapFilterLoadState();
    }
    if (event is CategoryFilterUpdated) {
      yield* _mapCategoryFilterUpdatedState(event, state);
    }
    if (event is PriceFilterUpdated) {
      yield* _mapPriceFilterUpdatedState(event, state);
    }
  }

  Stream<FiltersState> _mapFilterLoadState() async* {
    yield FiltersLoaded(
        filter: Filter(
            categoryFilters: CategoryFilter.filters,
            priceFilters: PriceFilter.filters));
  }

  Stream<FiltersState> _mapCategoryFilterUpdatedState(
      CategoryFilterUpdated event, FiltersState state) async* {
    if (state is FiltersLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();
      yield FiltersLoaded(
          filter: Filter(
              categoryFilters: updatedCategoryFilters,
              priceFilters: state.filter.priceFilters));
    }
  }

  Stream<FiltersState> _mapPriceFilterUpdatedState(
      PriceFilterUpdated event, FiltersState state) async* {
    if (state is FiltersLoaded) {
      final List<PriceFilter> updatedPriceFilters =
          state.filter.priceFilters.map((priceFilters) {
        return priceFilters.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilters;
      }).toList();
      yield FiltersLoaded(
          filter: Filter(
              categoryFilters: state.filter.categoryFilters,
              priceFilters: updatedPriceFilters));
    }
  }
}
