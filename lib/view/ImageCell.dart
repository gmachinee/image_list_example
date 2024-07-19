import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../model/ImageModel.dart';

typedef OnFavoriteListener = void Function(bool isFavorite);

/// ImageCell은 이미지 목록을 구성하는 셀입니다.
class ImageCell extends StatelessWidget {
  final ImageModel image;
  final GestureTapCallback onTap;

  ImageCell({super.key, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    // 즐겨찾기 버튼 생성
    buildFavoriteButton() {
      return GestureDetector(
          onTap: () {
          },
          child: false ?
          const Icon(Icons.favorite, color: Colors.pink, size: 30,) :
          const Icon(Icons.favorite_outline, color: Colors.white, size: 30,)
      );
    }

    // 이미지 위젯 생성
    buildImage() {
      return CachedNetworkImage(
        imageUrl: image.imageUrl!,
        fit: BoxFit.cover,
        imageBuilder: (context, imageProvidier) {
          return Stack(
            children: [
              Image(image: imageProvidier),
              // 이미지 로드된 후 즐겨찾기 버튼 생성
              Align(alignment: Alignment.topRight, child: buildFavoriteButton()),
            ],
          );
        },
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return const Center(child: SizedBox(
              width: 40.0, height: 40.0,
              child: CircularProgressIndicator(color: Colors.grey,)
          ));
        },
        errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.white),
      );
    }

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          buildImage(),
          Text(image.displaySitename!,style: const TextStyle(fontSize: 12, color: Colors.white),),
        ],
      )
    );
  }
}