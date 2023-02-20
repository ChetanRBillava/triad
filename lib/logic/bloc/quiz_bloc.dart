// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/constants/quizQuestions.dart';
import '../../presentation/router/app_router.dart';
import '../../presentation/utils/custom_print.dart';
import '../../presentation/widgets/dialogs.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  QuizBloc() : super(QuizInitial()) {
    on<QuizEvent>((event, emit) async {
      // TODO: implement event handler
      if(event is QuizInitialise){
        emit(QuizLoading());
        Map fq, sq, tq;

        fq = firstQuestion[Random().nextInt(firstQuestion.length)];
        sq = secondQuestion[Random().nextInt(secondQuestion.length)];
        tq = thirdQuestion[Random().nextInt(thirdQuestion.length)];


        customPrint.myCustomPrint(fq);
        customPrint.myCustomPrint(sq);
        customPrint.myCustomPrint(tq);

        emit(QuizStarted(firstQuestion: fq, secondQuestion: sq, thirdQuestion: tq, fqANS: 'z', sqANS: 'z', tqANS: 'z'));
        Navigator.of(event.context).pushNamed(AppRouter.quizQuestions);
      }
      else if(event is QuizSelectOption){
        Map fq = (state as QuizStarted).firstQuestion, sq = (state as QuizStarted).secondQuestion, tq = (state as QuizStarted).thirdQuestion;
        String fqAns = (state as QuizStarted).fqANS, sqAns = (state as QuizStarted).sqANS, tqAns = (state as QuizStarted).tqANS;
        customPrint.myCustomPrint(event.qNum);
        customPrint.myCustomPrint(event.selOption);
        if(event.qNum==1){
          fqAns = event.selOption;
        }
        else if(event.qNum==2){
          sqAns = event.selOption;
        }
        else{
          tqAns = event.selOption;
        }

        emit(QuizStarted(firstQuestion: fq, secondQuestion: sq, thirdQuestion: tq, fqANS: fqAns, sqANS: sqAns, tqANS: tqAns));
      }
      else if(event is QuizDone){
        String fqANS = (state as QuizStarted).fqANS, sqANS = (state as QuizStarted).sqANS, tqANS = (state as QuizStarted).tqANS;

        if(fqANS == 'z' || sqANS == 'z' || tqANS == 'z'){
          ScaffoldMessenger.of(event.context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 3),
                content: Text('Please select your answers!!!'),
              )
          );
        }
        else{
          quizCompletionDialog(event.context);
        }
      }
      else if(event is QuizSubmit){

        if(event.name.isEmpty){
          ScaffoldMessenger.of(event.context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 3),
                content: Text('Please enter your name'),
              )
          );
        }
        else if(event.name.length<3){
          ScaffoldMessenger.of(event.context).showSnackBar(
              const SnackBar(
                duration: Duration(seconds: 3),
                content: Text('Please enter a proper name'),
              )
          );
        }
        else{
          String fqANS = (state as QuizStarted).fqANS, sqANS = (state as QuizStarted).sqANS, tqANS = (state as QuizStarted).tqANS;
          Map fq = (state as QuizStarted).firstQuestion, sq = (state as QuizStarted).secondQuestion, tq = (state as QuizStarted).thirdQuestion;
          int score = 0;

          customPrint.myCustomPrint('First question: ${fq['question']}');
          customPrint.myCustomPrint('Selected option: ${fq[fqANS]}');
          customPrint.myCustomPrint('Correct answer: ${fq['answer']}');
          if(fq['answer'] == fq[fqANS]){
            score +=1;
          }

          customPrint.myCustomPrint('Second question: ${sq['question']}');
          customPrint.myCustomPrint('Selected option: ${sq[sqANS]}');
          customPrint.myCustomPrint('Correct answer: ${sq['answer']}');
          if(sq['answer'] == sq[sqANS]){
            score +=1;
          }

          customPrint.myCustomPrint('Third question: ${tq['question']}');
          customPrint.myCustomPrint('Selected option: ${tq[tqANS]}');
          customPrint.myCustomPrint('Correct answer: ${tq['answer']}');
          if(tq['answer'] == tq[tqANS]){
            score +=1;
          }

          customPrint.myCustomPrint('Final score: $score/3');


          SharedPreferences prefs = await SharedPreferences.getInstance();
          List<Map> finalLeaderboard = [];
          String encodedMap = prefs.getString('quizLeaderBoard') ?? '';
          if(encodedMap==''){
            customPrint.myCustomPrint('No scores yet');
            Map<String, dynamic> leaderboard = {
              'name': event.name,
              'score': score,
            };
            encodedMap = json.encode([leaderboard]);
            customPrint.myCustomPrint(encodedMap);

            prefs.setString('quizLeaderBoard', encodedMap);
            finalLeaderboard.add(leaderboard);
          }
          else{
            customPrint.myCustomPrint('Leaderboard found');
            List leaderboard = json.decode(encodedMap);
            customPrint.myCustomPrint(leaderboard);
            customPrint.myCustomPrint('New Leaderboard');
            leaderboard.add({
              'name': event.name,
              'score': score,
            });
            customPrint.myCustomPrint(leaderboard);
            customPrint.myCustomPrint('New sorted Leaderboard');
            leaderboard.sort((a,b) => (b['score']).compareTo(a['score']));
            encodedMap = json.encode(leaderboard);
            customPrint.myCustomPrint(encodedMap);

            for (var element in leaderboard) {
              finalLeaderboard.add(element);
            }
            prefs.setString('quizLeaderBoard', encodedMap);
          }


          emit(
            QuizResult(firstQuestion: fq, secondQuestion: sq, thirdQuestion: tq,
                fqANS: fqANS, sqANS: sqANS, tqANS: tqANS, score: score, name: event.name, leaderboard: finalLeaderboard)
          );
          Navigator.of(event.context).pushNamed(AppRouter.quizResults);
        }
      }
    });
  }
}
