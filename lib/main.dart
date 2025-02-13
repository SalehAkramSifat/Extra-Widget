import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: HomeActivity(),);
  }
}

class HomeActivity extends StatelessWidget {
  const HomeActivity({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Flutter Advance Widget"),centerTitle: true,),

      body: ListView(padding: EdgeInsets.all(10),
        children: [
          Card(child: ListTile(title: Text("Hero Animation"),
          leading: Hero(tag: "Hero-demo",child: Icon(Icons.star_border, color: Colors.redAccent,),),
          onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context) => HeroDetailPage()));},),),

        //Dialog=====================
        Card(child: ListTile(title: Text("Show Dialog"),leading: Icon(Icons.message,color: Colors.green,),
          onTap: (){showDialog(context: context, builder:(context) =>Dialog(
            child:Padding(padding: EdgeInsets.all(10),
              child: Text("This Is Dialog"),),));},

        ),),

          //Snack Bar============================
        Card(child: ListTile(title: Text("This Is Snackbar"),
          leading: Icon(Icons.notifications, color: Colors.blue,),
          onTap: (){ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("This Is Snackbar"),duration: Duration(seconds: 1),
          ),);},


        ),),


        ],),



    );
  }
}

class HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hero Detail Page")),
      body: Center(child: Hero(tag: "Hero-demo",child: Icon(Icons.star,color: Colors.blue,),),),

    );
    }
}
