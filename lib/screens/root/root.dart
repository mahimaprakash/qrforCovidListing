// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:qrcodescannerforcovidlist/models/auth.dart';
// import 'package:qrcodescannerforcovidlist/screens/home/home.dart';
// import 'package:qrcodescannerforcovidlist/screens/landing/landing.dart';
// import 'package:qrcodescannerforcovidlist/screens/login/login.dart';

// enum AuthStatus { unknown, notLoggedIn, loggedIn }

// class Root extends StatefulWidget {
//   @override
//   _RootState createState() => _RootState();
// }

// class _RootState extends State<Root> {
//   AuthStatus _authStatus = AuthStatus.unknown;
//   late String currentUid;

//   @override
//   void didChangeDependencies() async {
//     super.didChangeDependencies();

//     //get the state, check current user, set AuthStatus
//     AuthModel _authStream = Provider.of<AuthModel>(context);
//     if (_authStream != null) {
//       setState(() {
//         _authStatus = AuthStatus.loggedIn;
//         currentUid = _authStream.uid;
//       });
//     } else {
//       setState(() {
//         _authStatus = AuthStatus.notLoggedIn;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget retVal = LandingPage();
//     switch (_authStatus) {
//       case AuthStatus.unknown:
//         retVal = LandingPage();
//         break;
//       case AuthStatus.notLoggedIn:
//         retVal = Login();
//         break;
//       case AuthStatus.loggedIn:
//         retVal = StreamProvider.value(
//           initialData: null,
//           child: LoggedIn(),
//         );
//         break;
//       default:
//     }
//     return retVal;
//   }
// }

// class LoggedIn extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
