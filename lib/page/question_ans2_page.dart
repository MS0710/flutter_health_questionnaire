import 'package:flutter/material.dart';
import 'package:flutter_question/data/people.dart';
import 'package:flutter_question/ui/common_button.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../GetRoutes.dart';
import '../data/data.dart';
import '../ui/dashed_line.dart';

class QuestionAns2Page extends StatefulWidget{
  const QuestionAns2Page({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuestionAns2Page();
  }

}

class _QuestionAns2Page extends State<QuestionAns2Page>{
  List<int> groupValue = [];
  List<String> questionNum = [];
  late int questionLen;
  late People people;
  String ans1 = "是",ans2 = "否";
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
    print("build");
    people = ModalRoute.of(context)!.settings.arguments as People;
    questionLen = 0;

    if(people.title == "自律神經失調"){
      questionLen = QuestionData.autonomicNervousSystem.length;
    }else if(people.title == "天使綜合症"){
      questionLen = QuestionData.angel.length;
    }else if(people.title == "帶狀泡疹後神經痛"){
      questionLen = QuestionData.herpesZoster.length;
    }else if(people.title == "思覺失調症"){
      questionLen = QuestionData.schizophrenia.length;
    }else if(people.title == "巴金森氏症"){
      questionLen = QuestionData.parkinsonsDisease.length;
    }else{
      questionLen = 0;
    }
    print("Radio questionLen = $questionLen");

    if(pageFlag){
      if(people.title == "自律神經失調"){
        print("自律神經失調");
        groupValue.clear();
        questionNum.clear();
        for(int i=0 ;i<questionLen;i++){
          groupValue.add(-1);
          questionNum.add(QuestionData.autonomicNervousSystem[i]);
        }
        ans1 = "是";
        ans2 = "否";
      }else if(people.title == "天使綜合症"){
        groupValue.clear();
        questionNum.clear();
        for(int i=0 ;i<questionLen;i++){
          groupValue.add(-1);
          questionNum.add(QuestionData.angel[i]);
        }
        ans1 = "是";
        ans2 = "不是";
      }else if(people.title == "帶狀泡疹後神經痛"){
        groupValue.clear();
        questionNum.clear();
        for(int i=0 ;i<questionLen;i++){
          groupValue.add(-1);
          questionNum.add(QuestionData.herpesZoster[i]);
        }
        ans1 = "是";
        ans2 = "不是";
      }else if(people.title == "思覺失調症"){
        groupValue.clear();
        questionNum.clear();
        for(int i=0 ;i<questionLen;i++){
          groupValue.add(-1);
          questionNum.add(QuestionData.schizophrenia[i]);
        }
        ans1 = "是";
        ans2 = "不是";
      }else if(people.title == "巴金森氏症"){
        groupValue.clear();
        questionNum.clear();
        for(int i=0 ;i<questionLen;i++){
          groupValue.add(-1);
          questionNum.add(QuestionData.parkinsonsDisease[i]);
        }
        ans1 = "是";
        ans2 = "不是";
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
                              value: 1,
                              groupValue: groupValue[index],
                              activeColor: Theme.of(context).primaryColor,
                              onChanged: (data){
                                setState(() {
                                  print("Radio onChanged $index");
                                  groupValue[index] = data!;
                                  print("Radio groupValue[0] = ${groupValue[index]}");
                                });
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            Text(
                              ans1,
                              style: const TextStyle(
                                fontSize: 20.0,
                                color: Colors.black,
                                fontFamily: "content",
                              ),
                            ),

                            Radio(
                              value: 0,
                              groupValue: groupValue[index],
                              onChanged: (data){
                                setState(() {
                                  groupValue[index] = data!;
                                  print("Radio groupValue[0] = ${groupValue[index]}");
                                });
                              },
                              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            Text(
                              ans2,
                              style: const TextStyle(
                                fontSize: 20.0,
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