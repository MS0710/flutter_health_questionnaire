import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_question/ui/common_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../GetRoutes.dart';

class MainPage extends StatefulWidget{
  const MainPage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MainPage();
  }

}

class _MainPage extends State<MainPage>{
  TextEditingController nameController = TextEditingController();
  late SharedPreferences prefs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUseId();
  }
  
  void initUseId() async {
    prefs = await SharedPreferences.getInstance();
    nameController.text = prefs.getString("name")!;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var body = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/main_background.jpg"),
          fit: BoxFit.fill,
        )
      ),

      child: Column(
        children: [
          const SizedBox(height: 200,),
          const Text(
            "健康量測",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "jhd1",
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 120, 32, 110),
            ),
          ),

          const Text(
            "調查與記錄系統",
            style: TextStyle(
              fontSize: 30,
              fontFamily: "jhd1",
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 120, 32, 110),
            ),
          ),

          const SizedBox(height: 20,),
          SizedBox(
            width: 180,
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "請輸入您的名稱",
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),

          const SizedBox(height: 100,),
          CommonButton(
            title: "點擊開始",
            onTap: (){
              if(nameController.text != ""){
                prefs.setString("name", nameController.text);
                Navigator.pushNamed(context, GetRoutes.homePage,);
              }else{
                Fluttertoast.showToast(msg: "請輸入名稱");
              }
            },
            buttonColor: const Color.fromARGB(255, 151, 203, 241),
          ),

        ],
      ),
    );

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: body,
        ),
    );
  }

}