import 'package:flutter/material.dart';
import 'package:programming_knowledge/bottom_sheet.dart';
import 'package:programming_knowledge/container.dart';
import 'package:programming_knowledge/example1.dart';
import 'package:programming_knowledge/example2/example2.dart';
import 'package:programming_knowledge/flat_button.dart';
import 'package:programming_knowledge/grid_view.dart';
import 'package:programming_knowledge/http_request.dart';
import 'package:programming_knowledge/icon_button.dart';
import 'package:programming_knowledge/image_network.dart';
import 'package:programming_knowledge/ink_widget.dart';
import 'package:programming_knowledge/listview.dart';
import 'package:programming_knowledge/listview2.dart';
import 'package:programming_knowledge/media_query.dart';
import 'package:programming_knowledge/outline_button.dart';
import 'package:programming_knowledge/image_asset.dart';
import 'package:programming_knowledge/page2.dart';
import 'package:programming_knowledge/raised_button.dart';
import 'package:programming_knowledge/sample_screen.dart';
import 'package:programming_knowledge/text_field.dart';
import 'package:programming_knowledge/text_widget.dart';
import 'package:toast/toast.dart';
import 'package:programming_knowledge/rich_text.dart';

void main()  {
  runApp(
      MaterialApp(
          //home : MyApp(),
        initialRoute: '/',
        routes: {
          '/' :(context) => MyApp(),
          '/page2': (context) => Page2(),
          '/example1': (context) => MultiplicationTable(),
          '/container':(context) => ContainerExample(),
          '/image_asset': (context) => ImageAssetExample(),
          '/image_network': (context) => ImageNetworkExample(),
          '/listview': (context) => ListViewExample(),
          '/listview2': (context) => DismissibleWidgetListview(),
          '/text_field': (context) => TextFieldExample(),
          '/grid_view': (context) => GridViewExample(),
          '/sample_screen': (context) => SampleScreen(),
          '/http_request': (context) => HTTPRequestExample(),
          '/bottom_sheet': (context) => BottomSheetExample(),
          MediaQueryExample.routeName : (context) => MediaQueryExample(),
          Example2.routeName : (context) => Example2(),
        },
      )
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void _showToast({String msg, int duration,int gravity}) {
    Toast.show(msg, context,duration: duration, gravity: gravity,backgroundColor: Colors.amber);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //code goes here
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //code goes here
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lime,
        title: Text('Programming Knowledge'),
      ),
      //single scrollable screen
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Single Child ScrollView'),
              SizedBox(height: 5.0,),
              RichTextExample(),
                SizedBox(height: 5.0,),
              TextExample(),
                SizedBox(height: 5.0,),
              RaisedButtonExample(),
              FlatButtonExample(showToast: _showToast),
              OutlineButtonExample(),
              RaisedButton(
                // () =>
                  onPressed: () => _showToast(msg:'function calling with arguments when onPress trigger',duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM),
                child: Text('Press here'),),
              IconButtonExample(showToast: _showToast,),
              //custom icon button, shape decoration
              InkExample(),
              //Extended widgets
              FlatButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.alarm),
                  label: Text('Disabled Flat Button with Icon'),),
              RaisedButton.icon(
                  onPressed: null,
                  icon: Icon(Icons.flag),
                  label: Text('Disabled Raised Button with Icon'),
                disabledTextColor: Colors.white,),
              //box decoration
              RaisedButton(
                  onPressed: () => Navigator.pushNamed(context, '/container'),
                child: Text('Container'),
              )
            ],
          ),
        ),
      ),
      //only icon
      /*floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
        backgroundColor: Colors.red[900], //high: 900 low:100
      ),*/
      //include both icon and text using 'extended'
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.pushNamed(context, '/page2'),
          label: Text('Float'),
        icon: Icon(Icons.add),
        backgroundColor: Colors.red[600],
      ),
    );
  }
}

