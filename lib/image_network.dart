import 'package:flutter/material.dart';

class ImageNetworkExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Network Image & Decoration Image'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: Column(
          children: [
            Image.network('',
              frameBuilder: (BuildContext cotext,Widget child,int frame,bool isAsyncLoaded) {
                return Padding(
                  padding: EdgeInsets.all(10.0),
                  child: child,
                );
              },
              //display loader while loading or downloading image
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent loadingProgress){
                return Center(
                  child: Text('Image loading!!!'),
                );
              },
              //return a widget when an error occurs
              errorBuilder: (BuildContext context,Object object,StackTrace st){
                return Center(
                  child: Text('Error occured!'),
                );
              },
            ),
            //there is another way to display image using decoration property of container
            Container(
              width: 400.0,
              height: 400.0,
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.green,
                image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  alignment: Alignment.topLeft,
                  image: AssetImage('assets/night.jpeg'),
                  //or
                  //image: NetworkImage(''),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
