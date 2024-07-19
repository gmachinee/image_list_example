import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../model/ImageModel.dart';

// class DetailPage extends StatelessWidget {
//   ImageModel image;
//
//   DetailPage({super.key, required this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // appBar: AppBar(title: Text(image.displaySitename!)),
//         appBar: AppBar(backgroundColor: Colors.black, foregroundColor: Colors.white,),
//         body: Center(
//             child: CachedNetworkImage(
//               imageUrl: image.imageUrl!,
//               fit: BoxFit.fitWidth,
//               progressIndicatorBuilder: (context, url, downloadProgress) => const Center(child: SizedBox(
//                   width: 40.0, height: 40.0,
//                   child: CircularProgressIndicator()
//               )),
//               errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.white),
//             )
//         )
//     );
//   }
// }