import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:userinformation/bloc/user/user_bloc.dart';
import 'package:userinformation/model/user/user.dart';
import 'package:userinformation/view/utils/commons/textwidget.dart';
import 'package:userinformation/view/utils/commons/topbar.dart';
import 'package:userinformation/view/utils/constant.dart';

class UserView extends StatelessWidget {
  User? user;

  @override
  Widget build(BuildContext context) {
    heightSize = MediaQuery.of(context).size.height;
    widthSize = MediaQuery.of(context).size.width;

    shortestSide = MediaQuery.of(context).size.shortestSide;
    isMobile = shortestSide < 600.0;
    orientation = MediaQuery.of(context).orientation;

    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoading) {
          SmartDialog.showLoading();
        } else {
          SmartDialog.dismiss();
        }
      },
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserListSuccess) {
            user = state.user;
            return Scaffold(
              appBar: TopBar(
                theme: primaryColor,
                title: 'User',
              ),
              body: body(context, orientation, user!),
            );
          }

          return Scaffold();
        },
      ),
    );
  }

  body(context, Orientation orientation, User user) {
    ///Responsive layout
    responsiveLayout(orientation);

    return GridView.builder(
      itemCount: user.data!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 8.0 / 10.0,
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(5),
          child: Card(
            semanticContainer: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            Image.network('${user.data![index].picture}').image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                TextWidget(
                  txtHeight: txtHeight,
                  scale: isMobile ? 0.80 : 0.60,
                  mainAxis: MainAxisAlignment.center,
                  label:
                      '${user.data![index].title}. ${user.data![index].firstName} ${user.data![index].lastName}',
                  color: txtColor,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
