import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{
  AnimationController controller;
  Animation profilePicture;
  Animation textAnimation;
  Animation listAnimation;
  Animation fabButtonAnimation;


  @override
  void initState() {
 controller = AnimationController(vsync: this,duration: Duration(seconds: 4));
profilePicture = Tween(begin: 0.0,end: 50.0).animate(CurvedAnimation(parent: controller , curve: Interval(0.0,0.20,curve: Curves.easeOut)));
textAnimation = Tween(begin: 0.0,end: 34.0).animate(CurvedAnimation(parent: controller , curve: Interval(0.20,0.40,curve: Curves.easeOut)));

listAnimation = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: controller , curve: Interval(0.40,0.75,curve: Curves.easeOut)));

fabButtonAnimation = Tween(begin: 0.0,end: 1.0).animate(CurvedAnimation(parent: controller , curve: Interval(0.75,1.0,curve: Curves.easeOut)));


controller.forward();
 controller.addListener(() {
   setState(() {
   });
 });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Transform.scale(
        scale: fabButtonAnimation.value,
        child: FloatingActionButton(onPressed: () {  },
          child: Icon(Icons.add),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        brightness: Brightness.light,
        elevation: 0,
       backgroundColor: Colors.white,
       actions: [
         IconButton(onPressed: (){

         },
             color: Colors.black,
             iconSize: profilePicture.value,
             icon: Icon(Icons.supervised_user_circle)
         )
       ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Good Morning",
            style: TextStyle(fontSize: textAnimation.value, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 16.0,
          ),
          Text(
            "Here are your plans for today",
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 30,),

          Opacity(
            opacity: listAnimation.value,
            child: ListView.builder(
              itemCount: 6,
              shrinkWrap: true,
              itemBuilder: (context, position) {
                return CheckboxListTile(
                  title: Text("This is item $position"),
                  value: true,
                  onChanged: (val) {},
                );
              },
            ),
          )
        ],
      ));
  }

  @override
  void dispose() {

  }
}