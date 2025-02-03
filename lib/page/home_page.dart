import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_question/ui/grid_button_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../GetRoutes.dart';
import '../data/people.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePage();
  }

}

class _HomePage extends State<HomePage>{
  var title = ["自律神經失調","腦神經衰弱","天使綜合症","失智症","巴金森氏症",
  "思覺失調症", "失眠症","嗜睡症","憂鬱症","焦慮症","過動症","帶狀泡疹後神經痛",];

  var questionTitle = [
    ["自律神經失調量表","請根據您真實的狀況填寫。","2"],
    ["大腦疲勞指數量表","請根據您過去兩週的狀況填寫。","3"],
    ["天使綜合症量表","請依照您真實的狀況填寫。","2"],
    ["失智症量表","請依照您真實的狀況填寫。","3"],
    ["巴金森氏症量表","請依照您真實的狀況填寫。","2"],
    ["思覺失調症量表","請依照您真實的狀況填寫。","2"],
    ["失眠症量表","請根據你過去四星期的睡眠狀況填寫。","5"],
    ["嗜睡症量表","請根據你最近白天生活的常態填寫。","4"],
    ["憂鬱症量表","請根據您真實的狀況填寫。","4"],
    ["焦慮症量表","請根據過去兩個星期，你有多常受以下問題困擾？","4"],
    ["過動症(ADHD)量表","請根據您真實的狀況填寫。","5"],
    ["帶狀皰疹後神經痛量表 ","請根據您最近的狀況填寫。","2"],
  ];

  late SharedPreferences prefs;
  late String name;

  void initUseId() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs.getString("name")!;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initUseId();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    var body = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background2.jpg"),
            fit: BoxFit.fill,
          )
      ),
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 20,),
              DottedBorder(
                dashPattern: const [8, 4],
                strokeWidth: 2,
                padding: const EdgeInsets.all(10),
                color: const Color.fromARGB(255, 255, 255, 51),
                child: const Text(
                  "早安、你好、吃飽沒?\n今天想諮詢哪方面症狀的量表呢?",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "content",
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.all(5),
                width: double.infinity,
                height: 400,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, //横轴三个子widget
                      childAspectRatio: 3.0 //宽高比为1时，子widget
                  ),
                  itemCount: title.length,
                  itemBuilder: (context, index){
                    return GridButtonView(
                      content: title[index],
                      onTap: (){
                        switch(questionTitle[index][2]){
                          case "2":
                            Navigator.pushNamed(context, GetRoutes.questionAns2Page,
                              arguments: People(
                                name,
                                title[index],
                                questionTitle[index][0],
                                questionTitle[index][1],
                                0,
                              ),
                            );
                            break;
                          case "3":
                            Navigator.pushNamed(context, GetRoutes.questionAns3Page,
                              arguments: People(
                                name,
                                title[index],
                                questionTitle[index][0],
                                questionTitle[index][1],
                                0,
                              ),
                            );
                            break;
                          case "4":
                            Navigator.pushNamed(context, GetRoutes.questionAns4Page,
                              arguments: People(
                                name,
                                title[index],
                                questionTitle[index][0],
                                questionTitle[index][1],
                                0,
                              ),
                            );
                            break;
                          case "5":
                            Navigator.pushNamed(context, GetRoutes.questionAns5Page,
                              arguments: People(
                                name,
                                title[index],
                                questionTitle[index][0],
                                questionTitle[index][1],
                                0,
                              ),
                            );
                            break;
                          case "0":
                            break;
                        }

                      },
                    );
                  },
                ),
              ),
            ],
          ),

          Positioned(
            left: 20,
            bottom: 50,
            child: Row(
              children: [
                Image.asset(
                  "assets/shrimp.png",
                  height: MediaQuery.of(context).size.width/2,
                  width: MediaQuery.of(context).size.width/2,
                  fit: BoxFit.fill,
                ),

                SizedBox(
                  height: 100,
                  width: 150,
                  child: Align(
                    alignment: const Alignment(0,-5),
                    child: Container(
                      height: 80,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/bubble2.png"),
                            fit: BoxFit.fill,
                          )
                      ),
                      child: const Center(
                        child: Text(
                          "請選擇諮詢項目",
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: "content",
                            fontSize: 20,
                          ),
                        ),
                      ),

                    )
                  ),
                ),

              ],
            )
          ),

        ],
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: body,
      ),
    );
  }

}