import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'DetailPage.dart';
import 'ImageCell.dart';
import '../model/ImageModel.dart';
import '../view_model/FavoriteViewModel.dart';

/// FavoritePage는 즐겨찾기 페이지의 뷰를 담당합니다
class FavoritePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  /// 이미지 클릭
  onTapImage(ImageModel image) {
    // 상세 페이지로 이동
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailPage(image: image)));
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FavoriteViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: const Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite, color: Colors.pink,),
          Padding(padding: EdgeInsets.only(left: 8)),
          Text("Favorite"),
        ],
      ),), backgroundColor: Colors.black, foregroundColor: Colors.white,),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            itemCount: viewModel.favoriteImages.length,
            itemBuilder: (BuildContext context, int index) {
              final image = viewModel.favoriteImages[index];
              return ImageCell(
                onTap: () => onTapImage(image),
                image: image,
              );
            },
          ),
        ),
      ),
    );
  }
}

