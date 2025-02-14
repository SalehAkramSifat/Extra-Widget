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

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 2));
    return "Data loaded from FutureBuilder";
  }

  Stream<int> numberStream() async* {
    for (int i = 1; i <= 10; i++) {
      await Future.delayed(Duration(seconds: 1));
      yield i;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Flutter Advance Widget"),centerTitle: true,),

      body: ListView(padding: EdgeInsets.all(10),
        children: [
          //Hero====================
          Card(child: ListTile(title: Text("Hero Animation"),
          leading: Hero(tag: "Hero-demo",child: Icon(Icons.star_border, color: Colors.redAccent,),),
          onTap: (){Navigator.push(context,MaterialPageRoute(builder:(context) => HeroDetailPage()));},),),


        //Dialog=====================
        Card(child: ListTile(title: Text("Show Dialog"),leading: Icon(Icons.message,color: Colors.green,),
          onTap: (){showDialog(context: context, builder:(context) =>Dialog(
            child:Padding(padding: EdgeInsets.all(10),
              child: Text("This Is Dialog"),),));},
        ),),


          //Alert Dialog=========================
          Card(child: ListTile(title: Text("Alert Dialog"),leading: Icon(Icons.warning_amber, color: Colors.purpleAccent,),
          onTap: (){showDialog(context: context, builder:(context) => AlertDialog(
            title: Text("Are You Sure?"),
            content: Text("Are You Want to Sure Exit?"),
            actions: [TextButton(onPressed: () =>Navigator.pop(context), child: Text("Cancel")),
            TextButton(onPressed: ()=> Navigator.pop(context), child: Text("Sure"))],
          ));},),),


          //Snack Bar============================
        Card(child: ListTile(title: Text("This Is Snackbar"),
          leading: Icon(Icons.notifications, color: Colors.blue,),
          onTap: (){ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("This Is Snackbar"),duration: Duration(seconds: 1),
          ),);},
        ),),


          //Bottom Sheet========================
          Card(child: ListTile(title: Text("Bottom Sheet"),leading: Icon(Icons.arrow_upward, color: Colors.amber,),
            onTap: (){showModalBottomSheet(context: context, builder:(context) =>
                Container(padding: EdgeInsets.all(40),
                  child: Column(mainAxisSize: MainAxisSize.min,
                  children: [Text("This Is Your Bottom Sheet"), Icon(Icons.email_outlined),
                    SizedBox(height: 20,),
                  ElevatedButton(onPressed:()=> Navigator.pop(context), child: Text("Close", style: TextStyle(color: Colors.white),))],),) );},),),


          //Future Builder======================
          Card(child: ListTile(title: Text("Future Builder"),leading: Icon(Icons.hourglass_bottom_outlined, color: Colors.blue),
          onTap: (){showDialog(context: context, builder: (context)=> AlertDialog(title: Text("FutureBuilder Example"),
            content: FutureBuilder<String>(
                future: fetchData(),builder: (context, snapshot){
                  if (snapshot.connectionState ==  ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  else if(snapshot.hasError){
                    return Text("Error: ${snapshot.error}");
                  }
                  else {
                    return Text(snapshot.data ?? "No data");
                  }
            },),),);},),),

          //Stream Builder===============================
          Card(child: ListTile(title: Text("Stream Builder"), leading: Icon(Icons.stream, color: Colors.teal,),
            onTap: (){showDialog(context: context, builder: (context) =>
                AlertDialog(title: Text("Stream Builder Example"),
                  content: StreamBuilder<int>(
                    stream: numberStream(),builder: (context, snapshot){
                      if (snapshot.connectionState == ConnectionState.waiting){
                        return Text("Waiting for stream...");
                      }
                      else if(snapshot.hasError){
                        return Text("Error: ${snapshot.error}");
                      }
                      else{
                        return Text("Current Value: ${snapshot.error}");
                      }
                  }),));},))


        ],),



    );
  }
}

class HeroDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Hero Detail Page")),
      body: Center(child: Hero(tag: "Hero-demo",child: Icon(Icons.star,color: Colors.blue,size: 50),),),
    );
    }
}
