import 'package:flutter/material.dart';
import 'package:image_list_example/FavoritePage.dart';
import 'package:image_list_example/SearchPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ImageList Example',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: <Widget>[SearchPage(), FavoritePage()],
      ),
      bottomNavigationBar: TabBar(tabs: const <Tab>[
        Tab(icon: Icon(Icons.search, color: Colors.white)),
        Tab(icon: Icon(Icons.favorite_outline, color: Colors.white)),
      ],
        controller: tabController,
        indicatorColor: Colors.white,
        indicatorWeight: 3,
      ),
    );
  }
}
