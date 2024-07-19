import 'package:flutter/material.dart';

/// 즐겨찾기 리스트 페이지
class FavoritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FavoritePageState();
  }
}

class _FavoritePageState extends State<FavoritePage> {
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
          Text("Favorite"),
        ],
      ),), backgroundColor: Colors.black, foregroundColor: Colors.white,),
      body: Center(
      ),
    );
  }
}

