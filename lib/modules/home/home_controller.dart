import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fox_anime/components/anime_tabs_list_widget.dart';
import 'package:fox_anime/routes/app_routes.dart';
import 'package:fox_anime/services/api_services.dart/api.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomeController extends GetxController {
  final int pageSize = 5;

  final int pageSizeForTop = 7;

  final Rx _pagingController = Rx(PagingController(firstPageKey: 1));

  final RxString _animeType = RxString("");

  final RxInt _navbarIndex = RxInt(0);

  final RxBool _isFetchingTopAnimes = RxBool(false);

  final RxList _topAnimesData = RxList([]);

  final RxBool _isFetchingTappedAnimeData = RxBool(false);

  bool get isFetchingTappedAnimeData => _isFetchingTappedAnimeData.value;

  List get topAnimesData => _topAnimesData;

  bool get isFetchingTopAnimes => _isFetchingTopAnimes.value;

  int get navbarIndex => _navbarIndex.value;

  String get animeType => _animeType.value;

  PagingController get pagingController => _pagingController.value;

  @override
  void onInit() {
    getTopAnimes();
    pagingController.addPageRequestListener((pageKey) {
      getAnimesByFilter(pageKey);
    });
    super.onInit();
  }

  @override
  void dispose() {
    pagingController.dispose();
    super.dispose();
  }

  updateNavbarIndex(int value) {
    _navbarIndex.value = value;
    pagingController.refresh();
    update();
  }

  updateIsFetchingTopAnimes(bool value) {
    _isFetchingTopAnimes.value = value;
    update();
  }

  updateIsFetchingTappedAnimeData(bool value) {
    _isFetchingTappedAnimeData.value = value;
    update();
  }

  getAnimesByFilter(int pageKey) async {
    try {
      if (navbarIndex == 0) {
        _animeType.value = "bypopularity";
      } else if (navbarIndex == 1) {
        _animeType.value = "upcoming";
      } else {
        _animeType.value = "airing";
      }

      final response = await Api.instance.getTopAnimesByFilter(animeType, pageKey, pageSize);
      final isLastPage = response["data"].length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(response["data"]);
      } else {
        int nextPageKey = pageKey + 1;
        pagingController.appendPage(
          response["data"],
          nextPageKey,
        );
      }
    } catch (e) {
      pagingController.error = e;
    }
  }

  getTopAnimes() async {
    updateIsFetchingTopAnimes(true);
    try {
      final response = await Api.instance.getTopAnimes(pageSizeForTop);
      _topAnimesData.value = response["data"];
      updateIsFetchingTopAnimes(false);
    } catch (e) {
      updateIsFetchingTopAnimes(false);
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  getAnimeData(String query) async {
    updateIsFetchingTappedAnimeData(true);
    try {
      final response = await Api.instance.searchAnimeHome(query);
      updateIsFetchingTappedAnimeData(false);
      return response["animeList"];
    } catch (e) {
      updateIsFetchingTappedAnimeData(false);
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
