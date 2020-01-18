import 'package:flutter/material.dart';

int selectedTab = 0;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Explore'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          //Background gray
          color: Colors.grey[100],
        ),
        Container(
          //Background white
          margin: EdgeInsets.only(left: 100.0),
          width: double.infinity,
          color: Colors.white,
          child: Column(
            children: <Widget>[],
          ),
        ),
        Container(
          // Side Menu
          color: Colors.transparent,
          width: 100,
          child: Material(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 0;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Recommended',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color:
                                  selectedTab == 0 ? Colors.black : Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          selectedTab == 0
                              ? Container(
                                  height: 2,
                                  width: 80,
                                  color: Colors.purple,
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 1;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Sofas',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color:
                                  selectedTab == 1 ? Colors.black : Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          selectedTab == 1
                              ? Container(
                                  height: 2,
                                  width: 50,
                                  color: Colors.purple,
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedTab = 2;
                    });
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Tables',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color:
                                  selectedTab == 2 ? Colors.black : Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          selectedTab == 2
                              ? Container(
                                  height: 2,
                                  width: 50,
                                  color: Colors.purple,
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          //Top bar
          padding: EdgeInsets.only(top: 20, left: 10, right: 10),
          color: Colors.transparent,
          height: 100,
          child: Material(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.dialpad,
                        color: Colors.black,
                        size: 25,
                      ),
                      onPressed: () {
                        print('I love bakatan');
                      },
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Text(
                      "Explore",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 25,
                      ),
                      onPressed: () {
                        print('I love melon');
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
