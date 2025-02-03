import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../GetRoutes.dart';
import '../data/data.dart';
import '../data/people.dart';
import '../ui/common_button.dart';
import '../ui/dashed_line.dart';

class QuestionAns3Page extends StatefulWidget{
  const QuestionAns3Page({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _QuestionAns3Page();
  }

}

class _QuestionAns3Page extends State<QuestionAns3Page>{
  List<int> groupValue = [];
  List<String> questionNum = [];
  late int questionLen;
  final double radioSize = 18.0;
  String ans1 = "是",ans2 = "不是",ans3 = "不知道";
  bool pageFlag = true;
  late String currentTitle;
  List<String> currentContentFlag = [];

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
    currentTitle = people.title;

    if(people.title == "失智症"){
      questionLen = QuestionData.dementia.length;
    }else if(people.title == "腦神經衰弱"){
      questionLen = QuestionData.brainFatigueIndex.length;
    }else{
      questionLen = 0;
    }
    print("Radio questionLen = $questionLen");

    if(pageFlag){
      if(people.title == "失智症"){
        print("失智症");
        groupValue.clear();
        questionNum.clear();
        for(int i=0 ;i<questionLen;i++){
          groupValue.add(-1);
          questionNum.add(QuestionData.dementia[i]);
        }
        ans1 = "是";
        ans2 = "不是";
        ans3 = "不知道";
        //print("Radio questionNum[1] = ${questionNum[1]}");
      }else if(people.title == "腦神經衰弱"){
        print("腦神經衰弱");
        groupValue.clear();
        questionNum.clear();
        for(int i=0 ;i<questionLen;i++){
          groupValue.add(-1);
          questionNum.add(QuestionData.brainFatigueIndex[i][1]);
          currentContentFlag.add(QuestionData.brainFatigueIndex[i][0]);
        }
        ans1 = "很少";
        ans2 = "偶爾";
        ans3 = "總是";
      }else{
        print("clean all");
        groupValue.clear();
        questionNum.clear();
      }
      pageFlag = false;
    }

    var body = people.title == "失智症" ? dementiaView(context) : brainFatigueIndexView(context);

    return Scaffold(
      body: SafeArea(child: body,),
    );
  }

  Widget dementiaView(BuildContext context){
    People people = ModalRoute.of(context)!.settings.arguments as People;
    return Container(
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
  }

  Widget brainFatigueIndexView(BuildContext context){
    People people = ModalRoute.of(context)!.settings.arguments as People;
    return Container(
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
                  return QuestionData.brainFatigueIndex[index][0] == "title" ?
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      QuestionData.brainFatigueIndex[index][1],
                      style: const TextStyle(
                        color:  Color.fromARGB(255, 147, 0, 147),
                        fontFamily: "content",
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ): Container(
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
                              activeColor: Theme.of(context).primaryColor,
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
                              activeColor: Theme.of(context).primaryColor,
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

  }

  int calScore(){
    int score = 0;
    if(currentTitle == "失智症"){
      for(int i=0; i<questionLen;i++){
        if(groupValue[i] == 1){
          score = score + groupValue[i];
        }
      }
    }else{
      for(int i=0; i<questionLen;i++){
        if(currentContentFlag[i] == "content" && groupValue[i] != -1){
          score = score + groupValue[i];
        }
      }
    }
    print("score = $score");
    print("-----------");
    return score;
  }

  bool isWriteEveryQuestion(){
    for(int i=0; i<questionLen;i++){
      if(currentTitle == "失智症"){
        if(groupValue[i] == -1){
          return false;
        }
      }else{
        if(currentContentFlag[i] == "content"){
          if(groupValue[i] == -1){
            return false;
          }
        }
      }

    }
    return true;
  }

}