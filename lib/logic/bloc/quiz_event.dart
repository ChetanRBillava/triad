part of 'quiz_bloc.dart';

abstract class QuizEvent extends Equatable {
  const QuizEvent();
}

class QuizInitialise extends QuizEvent{
  final BuildContext context;
  const QuizInitialise({required this.context});

  @override
  // TODO: implement props
  List<Object?> get props => [context];

}

class QuizSelectOption extends QuizEvent{
  final int qNum;
  final String selOption;
  const QuizSelectOption({required this.qNum, required this.selOption});

  @override
  // TODO: implement props
  List<Object?> get props => [qNum, selOption];
}

class QuizDone extends QuizEvent{
  final BuildContext context;
  const QuizDone({required this.context});

  @override
  // TODO: implement props
  List<Object?> get props => [context];
}

class QuizSubmit extends QuizEvent{
  final BuildContext context;
  final String name;
  const QuizSubmit({required this.name, required this.context});

  @override
  // TODO: implement props
  List<Object?> get props => [name, context];
}