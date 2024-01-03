import 'package:flutter/material.dart';
import 'package:fox_anime/services/api_services.dart/api.dart';
import 'package:fox_anime/utils/custom_debounce_search.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class SearchController extends GetxController {
  final int pageSize = 6;

  final Rx _pagingController = Rx(PagingController(firstPageKey: 1));

  final Rx<TextEditingController> _searchTextController = Rx(TextEditingController());

  TextEditingController get searchTextController => _searchTextController.value;

  PagingController get pagingController => _pagingController.value;

  @override
  void dispose() {
    pagingController.dispose();
    searchTextController.dispose();
    super.dispose();
  }

  searchAnimes(int pageKey, {String query = ""}) async {
    try {
      final response = await Api.instance.searchAnime(query, pageKey, pageSize);
      final isLastPage = response["animeList"].length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(response);
      } else {
        int nextPageKey = pageKey + 1;
        pagingController.appendPage(
          response["animeList"],
          nextPageKey,
        );
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  onSearch(String value) async {
    if (value == "") {
      pagingController.refresh();
      return;
    }
    pagingController.itemList?.clear();
    await searchAnimes(1, query: value);
  }

  searchDebounce(String value) {
    final debounce = CustomDebounce(milliseconds: 1000);
    debounce.run(() {
      onSearch(value);
    });
  }
}
