import 'package:flutter/material.dart';
import 'package:flutter_question/data/people.dart';
import 'package:flutter_question/ui/common_button.dart';

import '../GetRoutes.dart';
import '../ui/dashed_line.dart';

class FinishPage extends StatefulWidget{
  const FinishPage({super.key,});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FinishPage();
  }
}

class _FinishPage extends State<FinishPage>{
  late DateTime dateTime;
  String picture = "assets/thumbs_up.png";
  String result = "正常情況";
  String comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
  late String date;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    People people = ModalRoute.of(context)!.settings.arguments as People;
    dateTime = DateTime.now();
    date = "${dateTime.year}.${dateTime.month}.${dateTime.day}";
    judgmentResult(people.title,people.ansScore);

    var body = Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background3.jpg"),
            fit: BoxFit.fill,
          )
      ),
      child: Column(
        children: [
          const SizedBox(height: 20,),
          Text(
            "量測結果為分數: ${people.ansScore}",
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "content",
              fontSize: 25,
            ),
          ),

          const SizedBox(height: 10,),
          Text(
            result,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "content",
              fontSize: 25,
            ),
          ),

          Container(
            padding: const EdgeInsets.all(10),
            child: LDashedLine(
              axis: Axis.horizontal,
              count: 50,
              dashedWidth: 5,
              dashedHeight: 1,
              dashedColor: Colors.black,
              dashedTotalLengthWith: double.infinity,
            ),
          ),

          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              comment,
              style: const TextStyle(
                color: Colors.black,
                fontFamily: "content",
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                flex: 1,
                child: Text(
                  "測驗日期 : ",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: "content",
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              Expanded(
                flex: 1,
                child: Text(
                  date,
                  style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "content",
                    fontSize: 23,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),

          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(picture),
          ),

          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text(
              "如果您認為上述狀況已影響您日常生活，建議諮詢專業醫師了解狀況!!",
              style: TextStyle(
                color: Colors.black,
                fontFamily: "content",
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          ),

          CommonButton(
            title: "返回主畫面",
            onTap: (){
              Navigator.pushReplacementNamed(context, GetRoutes.homePage,);
            },
            buttonColor: const Color.fromARGB(255, 201, 151, 194),
          ),
        ],
      ),

    );

    return Scaffold(
      body: SafeArea(
        child: body,
      ),
    );
  }

  void judgmentResult(String title,int score){
    switch(title){
      case "自律神經失調":
        if(score < 10){
          picture = "assets/thumbs_up.png";
          result = "正常情況";
          comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
        }else if(score <20){
          picture = "assets/magnifier.png";
          result = "輕度自律神經失調";
          comment = "提醒您隨時注意自己的身心狀況，必要時可至醫院進行相關檢查。";
        }else{
          picture = "assets/doctor.png";
          result = "中/重度自律神經失調";
          comment = "您有明顯中/重度自律神經失調，請立即尋找神經內科醫師協助。";
        }
        break;
      case "天使綜合症":
        if(score < 3){
          picture = "assets/thumbs_up.png";
          result = "正常情況";
          comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
        }else{
          picture = "assets/doctor.png";
          result = "可能有天使綜合症";
          comment = "您有明顯的天使綜合症症狀，建議您尋求神經內科醫師協助。";
        }
        break;
      case "帶狀泡疹後神經痛":
        if(score < 2){
          picture = "assets/thumbs_up.png";
          result = "正常情況";
          comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
        }else{
          picture = "assets/doctor.png";
          result = "疑似帶狀泡疹後神經痛";
          comment = "疑似有帶狀泡疹後神經痛或其他疾病症狀，請趕緊到醫院找專業可信賴的神經內科醫生做檢查。";
        }
        break;
      case "思覺失調症":
        if(score < 8){
          picture = "assets/thumbs_up.png";
          result = "正常情況";
          comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
        }else{
          picture = "assets/doctor.png";
          result = "可能有思覺失調症";
          comment = "您有思覺失調症的跡象，請立即尋求神經內科醫師協助。";
        }
        break;
      case "巴金森氏症":
        if(score < 3){
          picture = "assets/thumbs_up.png";
          result = "正常情況";
          comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
        }else{
          picture = "assets/doctor.png";
          result = "可能有巴金森氏症";
          comment = "您有患上巴金森氏症的跡象，請立即尋求神經內科醫師協助。";
        }
        break;
      case "失智症":
        if(score < 2){
          picture = "assets/thumbs_up.png";
          result = "正常情況";
          comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
        }else{
          picture = "assets/doctor.png";
          result = "可能有失智症";
          comment = "您有失智症的跡象，請尋求神經內科醫師協助檢查。";
        }
        break;
      case "腦神經衰弱":
        if(score < 10){
          picture = "assets/thumbs_up.png";
          result = "健康的大腦";
          comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
        }else if(score <20){
          picture = "assets/magnifier.png";
          result = "輕度/中度腦神經衰弱";
          comment = "建議您放慢生活步調，確保充足的休息與睡眠。";
        }else{
          picture = "assets/doctor.png";
          result = "重度腦神經衰弱";
          comment = "您有明顯的腦神經衰弱症狀，請立即尋求神經內科醫師協助。";
        }
        break;
      case "焦慮症":
        if(score < 5){
          picture = "assets/thumbs_up.png";
          result = "正常情況";
          comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
        }else if(score <10){
          picture = "assets/magnifier.png";
          result = "輕度焦慮症";
          comment = "請尋找親友分享，解除心中的焦慮。";
        }else{
          picture = "assets/doctor.png";
          result = "中/重度焦慮症";
          comment = "您有明顯的中/重度焦慮症症狀，請立即尋求神經內科醫師協助。";
        }
        break;
      case "憂鬱症":
        if(score < 9){
          picture = "assets/thumbs_up.png";
          result = "正常情況";
          comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
        }else if(score <28){
          picture = "assets/magnifier.png";
          result = "輕度憂鬱症";
          comment = "最近情緒是否起伏不定?請尋找親友分享，解除心中的困惑與心事。";
        }else{
          picture = "assets/doctor.png";
          result = "重度憂鬱症";
          comment = "您是否感到相當不舒服、難過?因為你的心已「感冒」，心病需要心藥醫，趕緊到醫院找專業可信賴的醫生檢查。";
        }
        break;
      case "嗜睡症":
        if(score < 4){
          picture = "assets/thumbs_up.png";
          result = "正常情況";
          comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
        }else if(score <9){
          picture = "assets/magnifier.png";
          result = "輕度嗜睡症";
          comment = "大部分是正常的，不放心就諮詢一下神經內科醫師吧!";
        }else{
          picture = "assets/doctor.png";
          result = "重度嗜睡症";
          comment = "您有明顯嗜睡症症狀，請立即尋求神經內科醫師協助。";
        }
        break;
      case "過動症":
        if(score < 17){
          picture = "assets/thumbs_up.png";
          result = "正常情況";
          comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
        }else if(score <24){
          picture = "assets/magnifier.png";
          result = "很可能有過動症";
          comment = "提醒您很可能有過動症(專注力不集中為主)，有疑問請聯絡醫生或有關的專業人士。";
        }else{
          picture = "assets/doctor.png";
          result = "非常可能有過動症";
          comment = "您有明顯過動症(專注力不集中為主)，請立即尋求醫生或有關的專業人士協助。";
        }
        break;
      case "失眠症":
        if(score < 9){
          picture = "assets/thumbs_up.png";
          result = "正常情況";
          comment = "您做得很好!請繼續保持良好的運動習慣與生活作息。";
        }else if(score <11){
          picture = "assets/magnifier.png";
          result = "輕度失眠症";
          comment = "需留意自身睡眠狀況，雖然還稱不上有睡眠問題，但應留意自己的睡面狀況。";
        }else{
          picture = "assets/doctor.png";
          result = "重度失眠症";
          comment = "您有明顯失眠症症狀，失眠是可以改善的，請尋求專業醫師協助。";
        }
        break;
      default:
        break;

    }

  }

}