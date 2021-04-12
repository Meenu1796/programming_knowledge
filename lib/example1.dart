import 'package:flutter/material.dart';

class MultiplicationTable extends StatefulWidget {
  @override
  _MultiplicationTableState createState() => _MultiplicationTableState();
}

class _MultiplicationTableState extends State<MultiplicationTable> {
  var _textController;
  @override
  void initState() {
    super.initState();
    _textController=TextEditingController();
    _textController.text='2';
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Multiplication Table'),
      ),
      body: Container(
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value){
                setState(() {
                  //_textController.text ??='1';  //not working
                  _textController.text=value;
                });
              },
              controller: _textController,
            ),
            //always specify height for listview if it is used in a column widget
            /*SizedBox(
              height: 200.0,
              child: ListView.builder(
                itemCount: 10,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      title: Text('${(index+1) * int.parse(_textController.text)}'),
                    );
                  }),
            ),*/
            //occupy the rest of the space
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context,int index){
                    return ListTile(
                      title: Text('${(index+1) * int.parse(_textController.text)}'),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
