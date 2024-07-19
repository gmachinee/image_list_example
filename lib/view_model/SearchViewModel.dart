import 'package:flutter/material.dart';
import '../repository/SearchRepository.dart';
import '../model/ImageModel.dart';

/// SearchViewModel은 검색 기능을 관리하고 뷰에 변경 사항을 알리는 역할을 수행합니다.
class SearchViewModel extends ChangeNotifier {
  final SearchRepository _repository;
  final List<ImageModel> _imageList = [];
  String _inputText = '';
  int _page = 1;
  bool _isLoading = false;

  SearchViewModel(this._repository);

  List<ImageModel> get imageList => _imageList;
  String get inputText => _inputText;
  bool get isLoading => _isLoading;

  void updateInputText(String text) {
    _inputText = text;
  }

  void nextPage() {
    _page++;
  }

  /// 검색 초기화
  void resetSearch() {
    _inputText = '';
    resetImageList();
  }

  /// 검색 시작
  void search() {
    resetImageList();
    getImageList();
  }

  /// 이미지 리스트 초기화
  void resetImageList() {
    _imageList.clear();
    _page = 1;
    notifyListeners();
  }

  /// 이미지 조회
  Future<void> getImageList() async {
    if (_isLoading) return;

    _isLoading = true;
    List<ImageModel> images = await _repository.getImageList(_inputText, _page);
    _imageList.addAll(images);
    _isLoading = false;

    notifyListeners();
  }
}
