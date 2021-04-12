import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImageAssetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Asset'),
      ),
      body: Container(
        color: Colors.red,
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text('Padding'),
            ),
            //always use container as parent widget to imageAsset
            Container(
              /* parent container widget(above one) height and weight - infinity. if we
              assign child widget height and weight - infinity, then error
              width: double.infinity,
              height: double.infinity,*/
              width: 200.0,
              height: 200.0,
              padding: EdgeInsets.all(5.0),
              color: Colors.green,
              //with frame-builder
              child: Image.asset(
                'assets/night.jpeg',
                /*height: 100.0,
                width: 100.0,*/
                //contain -large,source entirely within the target box
                //cover -small, clipped-out/
                //scaleDown- shrink the image, no stretching
                fit: BoxFit.scaleDown,
                alignment: Alignment.topRight,
                repeat: ImageRepeat.noRepeat,
                //frameBuilder- provide a frame around the image. it is a function returning a widget
                // for frame. relatable to a loader
                /*frameBuilder: (
                    BuildContext context,
                    Widget child, //contains the child widget itself
                    int frame, //contain frame index. useful in videos or GIF
                    _ //or bool wasSynchronouslyLoaded
                    ){
                  return Container(
                    padding: EdgeInsets.all(50.0),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle
                    ),
                    child: child,
                  );
                },*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
