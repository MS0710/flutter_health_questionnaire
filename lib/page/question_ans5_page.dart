import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../GetRoutes.dart';
import '../data/data.dart';
import '../data/people.dart';
import '../ui/common_button.dart';
import '../ui/dashed_line.dart';

class QuestionAns5Page extends StatefulWidget{
  const QuestionAns5Page({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuestionAns5Page();
  }

}

class _QuestionAns5Page extends State<QuestionAns5Page>{
  List<int> groupValue = [];
  List<String> questionNum = [];
  late int questionLen;
  final double radioSize = 18.0;
  String ans1 = "從未",ans2 = "很少",ans3 = "偶爾",ans4 = "經常",ans5 = "總是";
  bool pageFlag = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageFlag = true;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    People people = ModalRoute.of(context)!.settings.arguments as People;
    questionLen = 0;

    if(people.title == "過動症"){
      questionLen = QuestionData.ADHD.length;
    }else if(people.title == "失眠症"){
      questionLen = QuestionData.insomnia.length;
    }else{
      questionLen = 0;
    }
    print("Radio questionLen = $questionLen");

    if(pageFlag){
      if(people.title == "過動症"){
        print("過動症");
        groupValue.clear();
        questionNum.clear();
        for(int i=0 ;i<questionLen;i++){
          groupValue.add(-1);
          questionNum.add(QuestionData.ADHD[i]);
        }
      }else if(people.title == "失眠症"){
        print("失眠症");
        groupValue.clear();
        questionNum.clear();
        for(int i=0 ;i<questionLen;i++){
          groupValue.add(-1);
          questionNum.add(QuestionData.insomnia[i]);
        }
      }else{
        groupValue.clear();
        questionNum.clear();
      }
      pageFlag = false;
    }

    var body = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background4.jpg"),
            fit: BoxFit.fill,
          )
      ),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Text(
            people.questionTitle,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "content",
              fontSize: 25,
            ),
          ),

          const SizedBox(height: 10,),
          Text(
            people.questionSubtitle,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "content",
              fontSize: 21,
            ),
            textAlign: TextAlign.center,
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: LDashedLine(
              axis: Axis.horizontal,
              count: 50,
              dashedWidth: 5,
              dashedHeight: 1,
              dashedColor: const Color.fromARGB(255, 79, 168, 46),
              dashedTotalLengthWith: double.infinity,
            ),
          ),

          const SizedBox(height: 10,),
          Expanded(
            flex: 1,
            child: Container(
              width: double.infinity,
              child: ListView.separated(
                itemCount: questionLen,
                itemBuilder: (BuildContext context, int index){
                  return Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            questionNum[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontFamily: "content",
                              fontSize: 20,
                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Radio(
                              value: 0,
                              groupValue: groupValue[index],
                              activeColor: Theme.of(context).primaryColor,
                              onChanged: (data){
                                setState(() {
                                  groupValue[index] = data!;
                                });
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            Text(
                              ans1,
                              style: TextStyle(
                                fontSize: radioSize,
                                color: Colors.black,
                                fontFamily: "content",
                              ),
                            ),

                            Radio(
                              value: 1,
                              groupValue: groupValue[index],
                              onChanged: (data){
                                setState(() {
                                  groupValue[index] = data!;
                                });
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            Text(
                              ans2,
                              style: TextStyle(
                                fontSize: radioSize,
                                color: Colors.black,
                                fontFamily: "content",
                              ),
                            ),

                            Radio(
                              value: 2,
                              groupValue: groupValue[index],
                              onChanged: (data){
                                setState(() {
                                  groupValue[index] = data!;
                                });
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            Text(
                              ans3,
                              style: TextStyle(
                                fontSize: radioSize,
                                color: Colors.black,
                                fontFamily: "content",
                              ),
                            ),

                            Radio(
                              value: 3,
                              groupValue: groupValue[index],
                              onChanged: (data){
                                setState(() {
                                  groupValue[index] = data!;
                                });
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            Text(
                              ans4,
                              style: TextStyle(
                                fontSize: radioSize,
                                color: Colors.black,
                                fontFamily: "content",
                              ),
                            ),

                          ],
                        ),
                        Row(
                          children: [
                            Radio(
                              value: 4,
                              groupValue: groupValue[index],
                              onChanged: (data){
                                setState(() {
                                  groupValue[index] = data!;
                                });
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            Text(
                              ans5,
                              style: TextStyle(
                                fontSize: radioSize,
                                color: Colors.black,
                                fontFamily: "content",
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index){
                  return const Divider(color: Colors.black,);
                },
              ),
            ),
          ),

          const SizedBox(height: 10,),
          CommonButton(
            title: "提交，察看結果",
            onTap: (){
              print("提交，察看結果");
              if(isWriteEveryQuestion()){
                Navigator.pushReplacementNamed(context, GetRoutes.finishPage,arguments: People(
                  people.name,people.title,people.questionTitle,people.questionSubtitle,calScore(),),
                );
              }else{
                Fluttertoast.showToast(msg: "請完成每題作答");
              }
            },
            buttonColor: const Color.fromARGB(255, 169, 208, 154),
          ),
          const SizedBox(height: 10,),

        ],
      ),
    );

   return Scaffold(
     body: SafeArea(
       child: body,
     ),
   );
  }

  int calScore(){
    int score = 0;
    for(int i=0; i<questionLen;i++){
      if(groupValue[i] != -1){
        score = score + groupValue[i];
      }
    }
    print("score = $score");
    print("-----------");
    return score;
  }

  bool isWriteEveryQuestion(){
    for(int i=0; i<questionLen;i++){
      if(groupValue[i] == -1){
        return false;
      }
    }
    return true;
  }

}