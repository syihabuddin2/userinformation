import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userinformation/bloc/user/user_bloc.dart';
import 'package:userinformation/services/user/userservice.dart';
import 'package:userinformation/view/user/userview.dart';
import 'package:userinformation/view/utils/commons/navbarwidget.dart';
import 'package:userinformation/view/utils/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) {
            return UserBloc(
              userService: UserService(),
            )..add(LoadUserEvent());
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            print('main state: ${state}');
            int selectedIndex = 0;
            return Scaffold(
              backgroundColor: bgColor,
              body: UserView(),
              bottomNavigationBar: NavBarWidget(
                selectedIndex: selectedIndex,
              ),
            );
          },
        ),
      ),
    );
  }
}
