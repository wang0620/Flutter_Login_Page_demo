import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_page_demo/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;
  final FocusNode focusNode = FocusNode();

  Widget _buildEmailTBX() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: kLabelStyle,
        ),
        SizedBox(height: 10.0),
        Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(Icons.email, color: Colors.white),
                hintText: 'Enter your Email',
                hintStyle: kHintTextStyle,
              ),
            ))
      ],
    );
  }

  Widget _buildPasscodeTBX() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Passcode',
          style: kLabelStyle,
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle,
          height: 60.0,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.white, fontFamily: 'Source Sans Pro'),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              hintText: 'Enter your Passcode',
              hintStyle: kHintTextStyle,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildForgotPasscodeBTN() {
    return Container(
      alignment: Alignment.center,
      child: FlatButton(
          onPressed: () => print('Forgot Passcode BTN Pressed'), //Listener TBF
          padding: EdgeInsets.only(right: 0.0),
          child: Text(
            'Forgot Passcode?',
            style: kForgotBTN,
          )),
    );
  }

  Widget _buildRememberMeChkbox() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        children: <Widget>[
          Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                value: _rememberMe,
                checkColor: Colors.pinkAccent,
                activeColor: Colors.white,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value;
                  });
                },
              )),
          Text(
            'Remember me',
            style: kLabelStyle2,
          )
        ],
      ),
    );
  }

  Widget _buildLoginWithText() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25.0),
      width: double.infinity,
      child: RaisedButton(
          elevation: 5.0,
          onPressed: () => print("Login Button Pressed"),
          padding: EdgeInsets.all(15.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.white,
          child: Text(
            'Log In',
            style: kLoginBTN,
          )),
    );
  }

  Widget _buildDivider() {
    return Row(children: <Widget>[
      Expanded(child: Divider(color: Colors.white)),
      Text(
        "OR",
        style: kLabelStyle2,
      ),
      Expanded(
          child: Divider(
        color: Colors.white,
      )),
    ]);
  }

  Widget _buildSocialBTN(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBTNRow() {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _buildSocialBTN(
                () => print('Login with Facebook'),
                AssetImage(
                  '/Users/wyattwang/AndroidStudioProjects/login_page_demo/assets/logos/facebook.jpg',
                )),
            _buildSocialBTN(
                () => print('Login with Google'),
                AssetImage(
                  '/Users/wyattwang/AndroidStudioProjects/login_page_demo/assets/logos/google.jpg',
                )),
            _buildSocialBTN(
                () => print('Login with Apple ID'),
                AssetImage(
                  '/Users/wyattwang/AndroidStudioProjects/login_page_demo/assets/logos/apple.jpg',
                )),
          ],
        ));
  }

  Widget _buildSignupBTN() {
    return GestureDetector(
      onTap: () => print('Sign Up Button Pressed'),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Don\'t have an Account? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Sign Up',
              style: kForgotBTN,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF73AEF5),
                  Color(0xFF61A4F1),
                  Color(0xFF478DE0),
                  Color(0xFF398AE5),
                ],
                stops: [0.1, 0.4, 0.7, 0.9],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 120,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Source Sans Pro',
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  _buildEmailTBX(),
                  SizedBox(height: 30.0),
                  _buildPasscodeTBX(),
                  _buildRememberMeChkbox(),
                  _buildForgotPasscodeBTN(),
                  _buildLoginWithText(),
                  _buildDivider(),
                  _buildSocialBTNRow(),
                  _buildSignupBTN(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
