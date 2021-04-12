import 'package:flutter/material.dart';
import 'package:programming_knowledge/example2/example2.dart';
import 'package:programming_knowledge/grid_view.dart';
import 'package:programming_knowledge/media_query.dart';
import 'package:programming_knowledge/sample_screen.dart';
import 'package:programming_knowledge/text_field.dart';

class Page2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: ListView(
          children: [
            RaisedButton(
              child: Text('Asset Image'),
              onPressed: () => Navigator.pushNamed(context, '/image_asset'),
            ),
            RaisedButton(
              child: Text('Network Image'),
              onPressed: () => Navigator.pushNamed(context, '/image_network'),
            ),
            RaisedButton(
              child: Text('ListView'),
              onPressed: () => Navigator.pushNamed(context, '/listview'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.amber,
                child: Text('ListView 2 -> Dismissible,Divider'),
                onPressed: () => Navigator.pushNamed(context, '/listview2'),
              ),
            ),
            RaisedButton(
              child: Text('TextField'),
              onPressed: () => Navigator.pushNamed(context, '/text_field'),
            ),
            RaisedButton(
              child: Text('Example 1'),
              onPressed: () => Navigator.pushNamed(context, '/example1'),
            ),
            RaisedButton(
              child: Text('Grid View, Navigator-3 Push'),
              onPressed: () => Navigator.of(context).push(
                //push SampleScreen on top of Page2/parent
                  MaterialPageRoute(builder: (BuildContext context) => GridViewExample())),
            ),
            RaisedButton(
              child: Text('Navigator-1 popAndPushNamed & passing data'),
              //push : pushing a new screen on top of current screen
              //popAndPushNamed : previous/current/parent screen pop up and new screen push to stack
              //it is used when we don't want to go back to new/child screen
              //ex: parent1-> parent2-> child => on back press, it will go to parent 1 from child
              //without meeting parent 2 (parent 2 popped/deleted).
              //ex: parent -> child => on back press, a blank screen will appear
              // because there is no screen exists
              //pop : return to the screen/parent where the new screen has originated
              onPressed: () => Navigator.of(context).popAndPushNamed('/sample_screen',arguments: ['Hello','It\'s me','I was wondering','if','after all these years','you\'d like to meet']),
            ),
            RaisedButton(
              child: Text('Media Query and Named navigation-2 pushNamed'),
              //we have specify the route name
              onPressed: () => Navigator.of(context).pushNamed(MediaQueryExample.routeName),
              //Navigator.of(context).pushNamed('/media_query')
            ),
            RaisedButton(
              child: Text('HTTP Call'),
              onPressed: () => Navigator.of(context).pushNamed('/http_request'),
            ),
            RaisedButton(
              child: Text('Bottom Sheet'),
              onPressed: () => Navigator.of(context).pushNamed('/bottom_sheet'),
            ),
            RaisedButton(
              child: Text('Example 2'),
              onPressed: () => Navigator.of(context).pushNamed(Example2.routeName),
            ),
          ],
        ),
      ),
    );
  }
}
