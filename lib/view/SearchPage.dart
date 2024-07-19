import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../view_model/SearchViewModel.dart';
import '../model/ImageModel.dart';
import 'ImageCell.dart';

/// SearchPage는 검색 페이지의 뷰를 담당합니다.
class SearchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    // 무한 스크롤
    _scrollController!.addListener(() {
      final viewModel = Provider.of<SearchViewModel>(context);
      if (viewModel.isLoading) return;

      if (_scrollController!.offset >= _scrollController!.position.maxScrollExtent &&
          !_scrollController!.position.outOfRange) {
        viewModel.nextPage();
        viewModel.getImageList();
      }
    });
  }

  /// 이미지 클릭
  void onTapImage(BuildContext context, ImageModel image) {
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<SearchViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: _buildSearchBar()),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MasonryGridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            controller: _scrollController,
            itemCount: viewModel.imageList.length,
            itemBuilder: (BuildContext context, int index) {
              final image = viewModel.imageList[index];
              return ImageCell(
                onTap: () => onTapImage(context, image),
                image: image,
              );
            },
          ),
        ),
      ),
    );
  }

  /// 검색창을 생성합니다
  Widget _buildSearchBar() {
    final viewModel = Provider.of<SearchViewModel>(context);

    return SearchBar(
      trailing: const [Icon(Icons.search)],
      constraints: const BoxConstraints(maxWidth: 300, minHeight: 36),
      hintText: "검색어를 입력하세요",
      textInputAction: TextInputAction.done,
      onChanged: (text) {
        viewModel.updateInputText(text);
      },
      onSubmitted: (text) {
        if (viewModel.inputText.isNotEmpty) {
          viewModel.search();
          return;
        }

        // 검색어 미입력 시 스낵바로 알림
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("검색어를 입력하세요"),
          duration: Duration(seconds: 2),
        ));
      },
    );
  }
}
