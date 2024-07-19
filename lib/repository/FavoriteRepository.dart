import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/ImageModel.dart';

const FAVORITE_DATA_KEY = "favorite";

/// FavoriteRepository는 즐겨찾기 이미지를 로컬 저장소에 저장하고 로드하는 기능을 제공합니다.
class FavoriteRepository {
  late SharedPreferences pref;
  late List<ImageModel> _favoriteImageList;

  FavoriteRepository() {
    _favoriteImageList = List.empty(growable: true);
    _load();
  }

  List<ImageModel> get favoriteImageList => _favoriteImageList;

  /// 즐겨찾기 데이터를 불러옵니다
  void _load() async {
    pref = await SharedPreferences.getInstance();
    final json = pref.getString(FAVORITE_DATA_KEY);

    if (json != null && json.isNotEmpty) {
      _favoriteImageList = jsonDecode(json)['favorite_list']
          .map<ImageModel>((json) => ImageModel.fromJson(json))
          .toList();
    }
  }

  /// 즐겨찾기 이미지를 설정합니다
  void setFavoriteImage(ImageModel image, bool isFavorite) async {
    if (isFavorite) {
      _favoriteImageList.add(image);
    } else {
      _favoriteImageList.removeWhere((it) => it.imageUrl == image.imageUrl);
    }

    Map<String, dynamic> jsonMap = {
      'favorite_list': _favoriteImageList.map((image) => image.toJson()).toList(),
    };
    pref.setString(FAVORITE_DATA_KEY, jsonEncode(jsonMap));
  }

  bool isFavoriteImage(ImageModel image) {
    return _favoriteImageList.any((it) => it.imageUrl == image.imageUrl);
  }
}