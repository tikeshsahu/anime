import 'package:flutter/foundation.dart';
import 'package:fox_anime/utils/app_constants.dart';
import 'package:fox_anime/services/api_services.dart/dio_config.dart';

class Api {
  Api._();

  static final instance = Api._();

  final _dio = DioConfig.instance.getInstance();

  Future fetchAnimeByAnimeId({required String animeId}) async {
    try {
      final response = await _dio.get("${AppConstants.baseUri}/anime/$animeId");
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future fetchEpisodeByEpisodeId({required String episodeId}) async {
    try {
      final response = await _dio.get("${AppConstants.baseUri}/anime/episode/$episodeId");
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future searchAnime(String query, int pageKey, int pageSize) async {
    try {
      final response = await _dio.get("${AppConstants.baseUri}/anime/search/$query?pageSize=$pageSize");
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future getTopAnimesByFilter(String filter, int pageKey, int pageSize) async {
    try {
      final response = await _dio.get("${AppConstants.jikanUri}/top/anime?page=$pageKey&filter=$filter&limit=$pageSize");
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future getTopAnimes(int pageSize) async {
    try {
      final response = await _dio.get("${AppConstants.jikanUri}/top/anime?limit=$pageSize");
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  Future searchAnimeHome(String query) async {
    try {
      final response = await _dio.get("${AppConstants.baseUri}/anime/search/$query");
      return response.data;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }
}
