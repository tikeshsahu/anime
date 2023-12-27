

import 'package:flutter/foundation.dart';
import 'package:fox_anime/constants/app_constants.dart';
import 'package:fox_anime/services/api_services.dart/dio_config.dart';

class Api{
  Api._();

  static final instance = Api._();

  final _dio = DioConfig.instance.getInstance();


  Future fetchAnimeByAnimeId({required String animeId}) async {
    try {
      final response = await _dio.get("${AppConstants.baseUri}/anime/episode/$animeId");
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

  
}