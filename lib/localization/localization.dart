

import 'package:get/get.dart';

class LanguageTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'hello': 'Hello',
          "trending": "Trending",
          "popular": "Popular",
          "topRated": "Top Rated",
          "upcoming": "Upcoming",
          "animes": "Animes",
          "seeMore": "See More",
        },
        "hi_IN": {
          'hello': 'नमस्ते',
        }
      };
}