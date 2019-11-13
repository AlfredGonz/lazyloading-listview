import 'package:flutter/material.dart';

class ImageItem{
  final String content;
  final String image_url;

  ImageItem(this.content, this.image_url);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lazy Load',
      home: HomePage(title: 'Lazy Load'),);
  }
}

class HomePage extends StatefulWidget {

  final String title;
  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<ImageItem> data = [];
  int currentLenght = 0; //init lenght
  final int increment = 10; // limit loading
  bool isLoading = false; //flag to check

  @override
  void initState() {
    _loadMore();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

}
