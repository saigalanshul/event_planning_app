import 'package:flutter/material.dart';
import './detail_page.dart';
import './lesson.dart';
import './login.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
          primaryColor: Color.fromRGBO(58, 66, 86, 1.0), fontFamily: 'Raleway'),
      home: new Login(),

      // home: DetailPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  ListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
      contentPadding:
      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: new BoxDecoration(
            border: new Border(
                right: new BorderSide(width: 1.0, color: Colors.white24))),
        child: Icon(Icons.home, color: Colors.white),
      ),
      title: Text(
        lesson.title,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Container(
                // tag: 'hero',
                child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: lesson.indicatorValue,
                    valueColor: AlwaysStoppedAnimation(Colors.green)),
              )),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(lesson.level,
                    style: TextStyle(color: Colors.white))),
          )
        ],
      ),
      trailing:
      Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailPage(lesson: lesson)));
      },
    );

    Card makeCard(Lesson lesson) => Card(
      elevation: 8.0,
      margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Color.fromRGBO(58, 66, 86, 1.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.blur_on, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.assistant, color: Colors.white),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.account_box, color: Colors.white),
              onPressed: () {},
            )
          ],
        ),
      ),
    );
    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text(widget.title),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.list),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: topAppBar,
      body: makeBody,
      bottomNavigationBar: makeBottom,
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "Alankritha Art Gallery",
        level: "1 Star",
        indicatorValue: 0.33,
        price: 20,
        content:
      "Address: Residence Inn, Amar Coop Soc. Kavuri Hills, Jubilee Hills P.O.; "
          "City: Hyderabad;  "
          "Country: Andhra Pradesh 500033, India; "
          "Phone: 91 40 23113709"),
    Lesson(
        title: "All India Fine Arts and Crafts Society Gallery",
        level: "1 Star",
        indicatorValue: 0.33,
        price: 50,
        content:
"Address: 1 Rai Bhavan, Raja Marg Connaught Place;  "
    "City: New Delhi ;  "
    "Country: Delhi 110001, India;  "
    "Phone: 91 11 23711315?"),
    Lesson(
        title: "Art Folio",
        level: "3 Star",
        indicatorValue: 0.66,
        price: 30,
        content:
"City: Chandigarh;  "
    " Country: Chandigarh, India; "
    "Phone: 91-172-2741651") ,
    Lesson(
        title: "Anant Art Gallery",
        level: "3 Star",
        indicatorValue: 0.66,
        price: 30,
        content:
"Address: 213-B, Lado Sarai;  "
    " City: New Delhi;  "
    " Country: Delhi 110030, India; "
    "Phone: 91 11 41554775, 41554776"),
    Lesson(
        title: "Art Alive Gallery",
        level: "5 Star",
        indicatorValue: 1.0,
        price: 50,
        content:
"Address: S-221 Panchsheel Park;  "
    " City: New Delhi; "
    "Country: Delhi 110017, India;  "
    "Phone: 91 11 41639000, 41638050"),
    Lesson(
        title: "Art Musings",
        level: "5 Star",
        indicatorValue: 1.0,
        price: 50,
        content:
"Address: No.1 Admiratly Building Opp. Dunnes School, Colaba Cross Lane;  "
    "City: Mumbai;  "
    "Country: Maharashtra 400005, India;  "
    "Phone: 91 22 22163339"),
    Lesson(
        title: "Artists Centre Gallery",
        level: "5 Star",
        indicatorValue: 1.0,
        price: 50,
        content:
"Address: Ador House K Dubash Marg Kala Ghoda;  "
   " City: Mumbai;  "
    "Country: Maharashtra 400023, India") ,
  ];
}
