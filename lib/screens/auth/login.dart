import 'package:asmara_shop/blocs/login_bloc/login_bloc.dart';
import 'package:asmara_shop/consts/strings.dart';
import 'package:asmara_shop/consts/text_styles.dart';
import 'package:asmara_shop/enums/login_state.dart';
import 'package:asmara_shop/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:asmara_shop/consts/routes_strings.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey();
  bool _autoValidate = false;
  String _email, _password;
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
                state.status == LoginStatus.IDLE
                    ? Text(LOGIN_BELOW_STRING,
                        style: headingsLight.copyWith(
                          color: Colors.blue,
                          fontSize: 22,
                        ))
                    : Container(),
                state.status == LoginStatus.SUCCESSFUL
                    ? _navigateToDashboard
                    : Container(),
                state.status == LoginStatus.FAILED
                    ? Text(
                        AUTH_ERROR,
                        style: headingsBold.copyWith(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      )
                    : Container(),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (val) {
                    if (val.isNotEmpty) {
                      _email = val;
                    }
                  },
                  validator: _validateEmail,
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
                    labelText: EMAIL_FIELD_STRING,
                    labelStyle: normalText,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  onSaved: (val) {
                    if (val.isNotEmpty) {
                      _password = val;
                    }
                  },
                  validator: (String arg) {
                    if (arg.length < 9)
                      return PASSWORD_ERROR_STRING;
                    else
                      return null;
                  },
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
                SplashButton(
                  elevated: true,
                  color: state.status == LoginStatus.PROCESSING
                      ? Colors.grey[300]
                      : Colors.blue,
                  childWidget: state.status == LoginStatus.PROCESSING
                      ? Container(
                          height: 30,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : Text(
                          LOGIN_STRING.toUpperCase(),
                          style: headingsBold.copyWith(
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                  onPressed: state.status == LoginStatus.PROCESSING
                      ? () {}
                      : () {
                          if (_formKey.currentState.validate()) {
                            if (_autoValidate) {}
                            _formKey.currentState.save();

                            BlocProvider.of<LoginBloc>(context).add(
                              LoginwithEmailandPassword(
                                email: _email,
                                password: _password,
                              ),
                            );
                          } else {
                            setState(() {
                              _autoValidate = true;
                            });
                          }
                        },
                ),
                SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, REGISTER);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        NEW_USER_STRING,
                        style: headingsBold.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.w300,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(width: 9),
                      Text(
                        SIGN_UP_HERE_STRING,
                        style: headingsBold.copyWith(
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  _navigateToDashboard() {
    Navigator.pop(context);
    Navigator.pushNamed(context, HOME);
  }

  String _validateEmail(String value) {
    Pattern pattern = EMAIL_PATTERN_CHECK_STRING;
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return VALID_EMAIL_ERROR;
    else
      return null;
  }
}
