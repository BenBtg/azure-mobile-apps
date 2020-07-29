import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:timeago/timeago.dart';

void main() {
  runApp(MyApp());
}

class ProfilePic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Container(
            width: 50,
            height: 50,
            child: Image.network('https://www.fillmurray.com/100/101')));
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return SafeArea(
      child: Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 40, 0, 0),
                child: Text("SUNDAY 4 AUGUST",
                    style: GoogleFonts.josefinSans(
                        fontSize: 15, color: Color(0xFFFE7447))),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Blog",
                        style: GoogleFonts.josefinSans(
                            fontSize: 50, fontWeight: FontWeight.bold)),
                    ProfilePic(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0, 0, 0),
                child: FeaturedBlog(
                  author: "Bill Murray",
                  title: "My Best Bits",
                  profilePic: "https://www.fillmurray.com/50/50",
                  backgroundPic: "https://www.fillmurray.com/331/331",
                  createdDate: DateTime.now(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text("Blog",
                    style: GoogleFonts.josefinSans(
                        fontSize: 30, fontWeight: FontWeight.bold)),
              ),
            ]),
      ),
    );
  }
}

class FeaturedBlog extends StatelessWidget {
  final String title;
  final String author;
  final String profilePic;
  final String backgroundPic;
  final DateTime createdDate;

  const FeaturedBlog({
    Key key,
    this.title,
    this.author,
    this.createdDate,
    this.profilePic,
    this.backgroundPic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 332,
      height: 332,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: <Widget>[
            Image.network(
              backgroundPic,
              fit: BoxFit.fill,
            ),
            Container(
              color: Color(0x66666666),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(
                child: Icon(
                  Icons.bookmark_border,
                  color: Colors.white,
                  size: 30,
                ),
                alignment: Alignment.topRight,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Row(
                    children: <Widget>[
                      ProfilePic(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            author,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.timer,
                                color: Colors.white,
                              ),
                              Text(
                                createdDate.toString(),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}