import 'package:flutter/material.dart';
// import 'package:appvuela/@presentation/pages/login.dart';
import 'package:appvuela/@presentation/pages/main.dart';
// import 'package:appvuela/@presentation/pages/register/registerOptions.dart';
// import 'package:appvuela/@presentation/pages/register/registerPhone.dart';
// import 'package:appvuela/@presentation/pages/register/registerCode.dart';
// import 'package:appvuela/@presentation/pages/register/registerSuccess.dart';
// import 'package:appvuela/@presentation/pages/register/registerForm.dart';
import 'package:appvuela/@presentation/pages/password.dart';
// import 'package:appvuela/@presentation/pages/home.dart';
// import 'package:appvuela/@presentation/pages/video.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    // 'login': (BuildContext context) => LoginPage(),
    'main': (BuildContext context) => MainPage(),
    // 'registerOptions': (BuildContext context) => RegisterOptionsPage(),
    // 'registerPhone': (BuildContext context) => RegisterPhonePage(),
    // 'registerCode': (BuildContext context) => RegisterCodePage(),
    // 'registerSuccess': (BuildContext context) => RegisterSuccessPage(),
    // 'registerForm': (BuildContext context) => RegisterFormPage(),
    'password': (BuildContext context) => PasswordPage(),
    // 'home': (BuildContext context) => HomePage(),
    // 'video': (BuildContext context) => VideoPage(),
  };
}
