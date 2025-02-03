import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../GetRoutes.dart';

class RootPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _RootPage();
  }

}

class _RootPage extends State<RootPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var body = Column(
      children: [
        ElevatedButton(
            onPressed: (){
              Navigator.pushNamed(context, GetRoutes.mainPage,);
            },
            child: Text("main page"),
        ),

        const SizedBox(height: 20,),
        ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, GetRoutes.homePage,);
          },
          child: Text("home page"),
        ),

        const SizedBox(height: 20,),
        ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, GetRoutes.questionAns2Page,);
          },
          child: Text("questionAns2Page page"),
        ),

        const SizedBox(height: 20,),
        ElevatedButton(
          onPressed: (){
            Navigator.pushNamed(context, GetRoutes.finishPage,);
          },
          child: Text("finishPage page"),
        ),
      ],
    );

    return Scaffold(
      appBar: AppBar(title: Text("RootPage"),),
      body: body,
    );
  }

}