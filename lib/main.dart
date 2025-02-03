import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_question/page/finishPage.dart';
import 'package:flutter_question/page/home_page.dart';
import 'package:flutter_question/page/main_page.dart';
import 'package:flutter_question/page/question_ans2_page.dart';
import 'package:flutter_question/page/question_ans3_page.dart';
import 'package:flutter_question/page/question_ans4_page.dart';
import 'package:flutter_question/page/question_ans5_page.dart';
import 'package:flutter_question/page/root_page.dart';

import 'GetRoutes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    //Orientations
    //DeviceOrientation.landscapeLeft,
    //DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const MainPage(),
      routes: {
        GetRoutes.root: (context) => RootPage(),
        GetRoutes.mainPage: (context) => const MainPage(),
        GetRoutes.homePage: (context) => const HomePage(),
        GetRoutes.questionAns2Page: (context) => const QuestionAns2Page(),
        GetRoutes.questionAns3Page: (context) => const QuestionAns3Page(),
        GetRoutes.questionAns4Page: (context) => const QuestionAns4Page(),
        GetRoutes.questionAns5Page: (context) => const QuestionAns5Page(),
        GetRoutes.finishPage: (context) => const FinishPage(),
      },
    );
  }
}

