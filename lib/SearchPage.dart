import 'package:flutter/material.dart';

/// 이미지 검색 페이지
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
      appBar: AppBar(title: const Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("SearchPage"),
        ],
      ),), backgroundColor: Colors.black, foregroundColor: Colors.white,),
      body: Center(
      ),
    );
  }
}
