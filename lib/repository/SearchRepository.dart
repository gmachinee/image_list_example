import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/ImageModel.dart';

const REST_API_KEY = "d3314c60563130662513340d29ad2615";

/// SearchRepository는 API를 통해 이미지를 검색하고 결과를 반환하는 기능을 제공합니다.
class SearchRepository {
  /// 검색어에 해당하는 이미지를 조회합니다
  Future<List<ImageModel>> getImageList(String query, int page) async {
    final url = "https://dapi.kakao.com/v2/search/image?target=title&page=$page&query=$query";
    final response = await http.get(
        Uri.parse(url),
        headers: {"Authorization": "KakaoAK $REST_API_KEY"}
    );

    return jsonDecode(response.body)['documents']
        .map<ImageModel>((json) => ImageModel.fromJson(json))
        .toList();
  }
}
