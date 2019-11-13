import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';


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
    return Scaffold(
      appBar: AppBar(title: Text('Lazy Loading')),
      body: LazyLoadScrollView(
        isLoading: isLoading,
        onEndOfPage: () => _loadMore(),
        child: ListView.builder(
            itemCount: data.length,
            itemBuilder: (context,position){
              if(isLoading && position == data.length -1)
                {
                  return Center(child: CircularProgressIndicator());
                }
              else
                {
                  return DisplayCardItem(data[position]);
                }
            }),
      ),
    );
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

  Widget DisplayCardItem(ImageItem data) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Text(data.content,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
              )),

            Container(
              child: Stack(children: <Widget>[
                Image.network(data.image_url)
              ],))
          ],
        )),
    );
  }
}
