import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';
import 'package:userinformation/model/user/user.dart';
import 'package:userinformation/services/user/userservice.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserService userService;

  UserBloc({required this.userService}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is LoadUserEvent) {
      try {
        yield UserLoading();
        final responseUserData = await userService.getAllUser(limit: 20);

        if (responseUserData.data != null) {
          yield UserListSuccess(user: responseUserData);
        }
      } catch (e) {
        yield UserError(error: e.toString());
      }
    }
  }
}
