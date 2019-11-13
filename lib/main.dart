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

  Future _loadMore() async{
    setState(() {
      isLoading = true;
    });

    //Delay
    await new Future.delayed(const Duration(seconds: 2)); //2 seconds to display animation
    for (var i = currentLenght; i<= currentLenght + increment; i++) {
      if(i%2 == 0){
        data.add(new ImageItem('Image $i', 'https://cdn.pixabay.com/photo/2019/11/10/16/47/nature-4616282_1280.jpg'));
      }else{
        data.add(new ImageItem('Image $i', 'https://cdn.pixabay.com/photo/2016/08/09/21/54/yellowstone-national-park-1581879_1280.jpg'));
      }

      setState(() {
        isLoading = false;
        currentLenght = data.length;
      });
    }
  }
}
