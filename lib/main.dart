//@dart=2.9
import 'package:flutter/material.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.only(top: 30,left: 20,right: 20),
            child: MyWidget()),
          
        ),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  int currTab = 0;
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        //print("offset = ${_scrollController.offset}");
        currTab = (_scrollController.offset) ~/ ( 30);
        print(currTab);
        setState(() {});
      });
  }

  @override
  void dispose() {
    _scrollController
        .dispose(); // it is a good practice to dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Visibility(
                  visible: index >=currTab,
                  child: Container(
                      decoration: new BoxDecoration(
                          color: index == currTab ? Colors.red : Colors.blue,
                          borderRadius:
                              new BorderRadius.all(Radius.circular(10.0))),
                      width: 100,
                      child: Center(
                        child: Text(
                          "Tab $index",
                          style: TextStyle(color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      )),
                );
              },
              separatorBuilder: (_, __) => SizedBox(
                    width: 5,
                  ),
              itemCount: 5),
        ),
        // SingleChildScrollView(
        //   child: Row(
        //           children: <Widget>[
        //             for(int i=0;i<5;i++)
        //               Container(
        //                 decoration: new BoxDecoration(
        //           color:  i==currTab?Colors.red:Colors.blue,
        //           borderRadius: new BorderRadius.all(Radius.circular(10.0)
        //           )),
        //                 width: 100, child: Text("Tab "+i.toString(),style: TextStyle(color: Colors.white),textAlign: TextAlign.center,))
        //           ],

        //           ),
        // ),
        Expanded(
            child: ListView(
            
          controller: _scrollController,
          children: <Widget>[
            
              Container(
                color: Colors.amber,
                  height: 300, child: Text("Conten at 0 -" )),
            
              Container(
                color: Colors.white,
                  height: 300, child: Text("Conten at 1 -" )),
            
              Container(
                color: Colors.red,
                  height: 300, child: Text("Conten at 2 -" )),
            
              Container(
                color: Colors.black,
                  height: 300, child: Text("Conten at 3 -" )),
            
              Container(
                color: Colors.cyan,
                  height: 300, child: Text("Conten at 4 -" )),
          ],
        )),
      ],
    );
  }
}
