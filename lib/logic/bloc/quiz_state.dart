part of 'quiz_bloc.dart';

abstract class QuizState extends Equatable {
  const QuizState();
}

class QuizInitial extends QuizState {
  @override
  List<Object> get props => [];
}

class QuizLoading extends QuizState {
  @override
  List<Object> get props => [];
}

class QuizStarted extends QuizState {
  final Map firstQuestion, secondQuestion, thirdQuestion;
  final String fqANS, sqANS, tqANS;

  const QuizStarted({
    required this.firstQuestion, required this.secondQuestion, required this.thirdQuestion,
    required this.fqANS, required this.sqANS, required this.tqANS
  });

  @override
  List<Object> get props => [firstQuestion, secondQuestion, thirdQuestion, fqANS, sqANS, tqANS];
}

class QuizResult extends QuizStarted{
  final String name;
  final int score;
  final List<Map> leaderboard;
  const QuizResult({
    required super.firstQuestion, required super.secondQuestion, required super.thirdQuestion, required this.leaderboard,
    required super.fqANS, required super.sqANS, required super.tqANS, required this.score, required this.name
  });

  @override
  List<Object> get props => [super.firstQuestion, super.secondQuestion, super.thirdQuestion, leaderboard,
    super.fqANS, super.sqANS, super.tqANS, score, name];
}