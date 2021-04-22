import 'package:devquiz/home/home_state.dart';
import 'package:devquiz/home/repository/home_repository.dart';
import 'package:devquiz/shared/models/quiz_model.dart';
import 'package:devquiz/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';

class HomeController {
  ValueNotifier<HomeState> stateNotifier =
      ValueNotifier<HomeState>(HomeState.empty);
  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUsers() async {
    state = HomeState.loading;

    await Future.delayed(Duration(seconds: 2));

    user = await repository.getUsers();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;

    await Future.delayed(Duration(seconds: 2));

    quizzes = await repository.getQuizzers();

    state = HomeState.success;
  }
}
