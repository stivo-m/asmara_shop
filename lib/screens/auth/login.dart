import 'package:asmara_shop/blocs/login_bloc/login_bloc.dart';
import 'package:asmara_shop/consts/strings.dart';
import 'package:asmara_shop/consts/text_styles.dart';
import 'package:asmara_shop/enums/login_state.dart';
import 'package:asmara_shop/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: BlocProvider(
          create: (context) => LoginBloc(),
          child: BlocBuilder<LoginBloc, LoginState>(
            builder: (BuildContext context, LoginState state) {
              return _buildPageContent(context, state);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildPageContent(BuildContext context, LoginState state) {
    return ListView(
      children: <Widget>[
        SizedBox(height: 20),
        FlutterLogo(size: 200),
        SizedBox(height: 50),
        Container(
          height: 500,
          width: MediaQuery.of(context).size.width * 0.75,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  WELCOME_TEXT,
                  style: headingsBold.copyWith(
                    color: Colors.blue,
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                state.status == LoginStatus.SUCCESSFUL
                    ? Text("Success",
                        style: headingsBold.copyWith(
                          color: Colors.blue,
                          fontSize: 28,
                        ))
                    : Container(),
                state.status == LoginStatus.FAILED
                    ? Text("Failed",
                        style: headingsBold.copyWith(
                          color: Colors.red,
                          fontSize: 28,
                        ))
                    : Container(),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.person,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    labelText: LOGIN_STRING,
                    labelStyle: normalText,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Colors.blue,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    labelText: PASSWORD_STRING,
                    labelStyle: normalText,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                      onTap: () {},
                      child: Text(
                        REMEMBER_ME,
                        style: normalText.copyWith(color: Colors.blue),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        FORGOT_PASSWORD_STRING,
                        style: normalText.copyWith(color: Colors.blue),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                state.status == LoginStatus.PROCESSING
                    ? Container(height: 50, child: CircularProgressIndicator())
                    : SplashButton(
                        elevated: true,
                        label: LOGIN_STRING,
                      )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
