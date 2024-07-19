import 'package:flutter/material.dart';
import '../model/ImageModel.dart';
import '../repository/FavoriteRepository.dart';

/// FavoriteViewModel은 즐겨찾기 이미지를 관리하고 뷰에 변경 사항을 알리는 역할을 수행합니다.
class FavoriteViewModel extends ChangeNotifier {
  final FavoriteRepository _repository;

  FavoriteViewModel(this._repository);

  List<ImageModel> get favoriteImages => _repository.favoriteImageList;

  void toggleFavoriteStatus(ImageModel image) {
    _repository.setFavoriteImage(image, !isFavoriteImage(image));
    notifyListeners();
  }

  bool isFavoriteImage(ImageModel image) {
    return _repository.isFavoriteImage(image);
  }
}
