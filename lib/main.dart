import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'repository/SearchRepository.dart';
import 'repository/FavoriteRepository.dart';
import 'view/SearchPage.dart';
import 'view/FavoritePage.dart';
import 'view_model/SearchViewModel.dart';
import 'view_model/FavoriteViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SearchViewModel(SearchRepository()),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteViewModel(FavoriteRepository()),
        ),
      ],
      child: MaterialApp(
        title: 'ImageList Example',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  late TabController tabController;
  final List<Widget> _children = [SearchPage(), FavoritePage()];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _children,
      ),
      bottomNavigationBar: TabBar(tabs: const <Tab>[
        Tab(icon: Icon(Icons.search, color: Colors.white)),
        Tab(icon: Icon(Icons.favorite_outline, color: Colors.white)),
      ],
        controller: tabController,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        indicatorColor: Colors.white,
        indicatorWeight: 3,
      ),
    );
  }
}
