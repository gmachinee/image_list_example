import 'package:flutter/material.dart';

/// SearchPage는 검색 페이지의 뷰를 담당합니다.
class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchPageState();
  }
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: _buildSearchBar()), backgroundColor: Colors.black,),
      body: Center(
      ),
    );
  }

  /// 검색창을 생성합니다
  Widget _buildSearchBar() {
    return SearchBar(
      trailing: const [Icon(Icons.search)],
      constraints: const BoxConstraints(maxWidth: 300, minHeight: 36),
      hintText: "검색어를 입력하세요",
      textInputAction: TextInputAction.done,
      onChanged: (value) {
        debugPrint('input text: $value');
      },
      onSubmitted: (value) {
        // 검색어 미입력 시 스낵바로 알림
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("검색어를 입력하세요"),
          duration: Duration(seconds: 2),
        ));
      },
    );
  }
}
