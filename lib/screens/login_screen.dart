// // import 'package:flutter/material.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// // import 'package:graduation/utils/shared_prefs.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'dart:math';
// // import '../widgets/app_drawer.dart';

// // class LoginScreen extends StatefulWidget {
// //   LoginScreen({super.key});

// //   @override
// //   _LoginScreenState createState() => _LoginScreenState();
// // }

// // class _LoginScreenState extends State<LoginScreen> {
// //   final _formKey = GlobalKey<FormState>();
// //   final phoneController = TextEditingController();
// //   final otpController = TextEditingController();

// //   bool _isLoggedIn = false;
// //   String? _generatedOTP;
// //   bool _isLoading = false;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _checkLoginStatus();
// //   }

// //   void _checkLoginStatus() async {
// //     SharedPrefs preferences = await SharedPrefs.getInstance();
// //     bool isLoggedIn = preferences.getBool('isLoggedIn') ?? false;
// //     if (isLoggedIn) {
// //       Navigator.pushReplacementNamed(context, '/home');
// //     }
// //   }

// //   Future<void> _googleSignIn() async {
// //     GoogleSignIn googleSignIn = GoogleSignIn();
// //     try {
// //       var result = await googleSignIn.signIn();
// //       if (result != null) {
// //         String firstName = result.displayName!.split(" ")[0];
// //         String lastName = result.displayName!.split(" ")[1];
// //         _saveLoginState();
// //         Navigator.pushReplacementNamed(context, '/home', arguments: {'firstName': firstName, 'lastName': lastName});
// //       }
// //     } catch (error) {
// //       print(error);
// //     }
// //   }

// //   void _generateOTP() {
// //     setState(() {
// //       _generatedOTP = (Random().nextInt(9000) + 1000).toString();
// //     });
// //     showDialog(
// //       context: context,
// //       builder: (context) => AlertDialog(
// //         title: Text("Your OTP"),
// //         content: Text(_generatedOTP!),
// //         actions: [
// //           TextButton(
// //             onPressed: () => Navigator.pop(context),
// //             child: Text("OK"),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   void _verifyOTP() {
// //     setState(() {
// //       _isLoading = true;
// //     });
// //     Future.delayed(Duration(seconds: 3), () {
// //       setState(() {
// //         _isLoading = false;
// //       });
// //       if (otpController.text == _generatedOTP) {
// //         _saveLoginState();
// //         Navigator.pushReplacementNamed(context, '/home', arguments: {'phoneNumber': phoneController.text});
// //       } else {
// //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incorrect OTP")));
// //       }
// //     });
// //   }

// //   Future<void> _saveLoginState() async {
// //     SharedPrefs prefs = await SharedPrefs.getInstance();
// //     await prefs.setBool('isLoggedIn', true);
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Color.fromARGB(255, 2, 47, 17),
// //       appBar: AppBar(
// //         title: Text('Login'),
// //       ),
// //       drawer: AppDrawer(
// //         onLogout: () async {
// //           SharedPrefs prefs = await SharedPrefs.getInstance();
// //           await prefs.setBool('isLoggedIn', false);
// //         }, firstName: 'tasneem', lastName: 'hesham', phoneNumber: '555555555',
// //       ),
// //       body: SingleChildScrollView(
// //         child: SizedBox(
// //           height: MediaQuery.of(context).size.height,
// //           width: MediaQuery.of(context).size.width,
// //           child: Column(
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 50),
// //               ),
// //               Spacer(),
// //               Container(
// //                 padding: EdgeInsets.all(20),
// //                 height: MediaQuery.of(context).size.height * 2 / 3,
// //                 width: MediaQuery.of(context).size.width,
// //                 decoration: BoxDecoration(
// //                   color: Color.fromARGB(255, 155, 210, 84),
// //                   borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
// //                 ),
// //                 child: Form(
// //                   key: _formKey,
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.stretch,
// //                     children: [
// //                       const Text(
// //                         "LOGIN",
// //                         style: TextStyle(
// //                           fontSize: 40,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                         textAlign: TextAlign.center,
// //                       ),
// //                       SizedBox(height: 12),
// //                       TextFormField(
// //                         controller: phoneController,
// //                         decoration: InputDecoration(
// //                           prefixIcon: Icon(Icons.phone),
// //                           hintText: "Phone Number",
// //                           fillColor: Colors.white,
// //                           filled: true,
// //                           border: OutlineInputBorder(
// //                             borderSide: BorderSide(width: 1),
// //                             borderRadius: BorderRadius.circular(30),
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(height: 12),
// //                       TextFormField(
// //                         controller: otpController,
// //                         decoration: InputDecoration(
// //                           prefixIcon: Icon(Icons.lock),
// //                           hintText: "OTP Number",
// //                           fillColor: Colors.white,
// //                           filled: true,
// //                           border: OutlineInputBorder(
// //                             borderSide: BorderSide(width: 1),
// //                             borderRadius: BorderRadius.circular(30),
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(height: 12),
// //                       Align(
// //                         alignment: Alignment.centerRight,
// //                         child: Padding(
// //                           padding: const EdgeInsets.symmetric(vertical: 16.0),
// //                           child: SizedBox(
// //                             width: 150,
// //                             child: ElevatedButton(
// //                               style: ElevatedButton.styleFrom(
// //                                 elevation: 10,
// //                                 backgroundColor: Color.fromARGB(255, 2, 47, 17),
// //                                 foregroundColor: Color.fromARGB(255, 155, 210, 48),
// //                               ),
// //                               onPressed: _generateOTP,
// //                               child: Text(
// //                                 "Generate OTP",
// //                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(height: 12),
// //                       Align(
// //                         alignment: Alignment.center,
// //                         child: Padding(
// //                           padding: const EdgeInsets.symmetric(vertical: 8.0),
// //                           child: SizedBox(
// //                             width: 230,
// //                             child: _isLoading
// //                                 ? SizedBox(
// //                                     width: 24,
// //                                     height: 24,
// //                                     child: CircularProgressIndicator(
// //                                       strokeWidth: 2.0,
// //                                       color: Color.fromARGB(255, 2, 47, 17),
// //                                     ),
// //                                   )
// //                                 : ElevatedButton(
// //                                     style: ElevatedButton.styleFrom(
// //                                       elevation: 10,
// //                                       backgroundColor: Color.fromARGB(255, 2, 47, 17),
// //                                       foregroundColor: Color.fromARGB(255, 155, 210, 48),
// //                                     ),
// //                                     onPressed: _verifyOTP,
// //                                     child: Text(
// //                                       "Verify OTP",
// //                                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
// //                                     ),
// //                                   ),
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(height: 12),
// //                       Align(
// //                         alignment: Alignment.center,
// //                         child: Padding(
// //                           padding: const EdgeInsets.symmetric(vertical: 8.0),
// //                           child: SizedBox(
// //                             width: 230,
// //                             child: ElevatedButton(
// //                               style: ElevatedButton.styleFrom(
// //                                 elevation: 10,
// //                                 backgroundColor: Color.fromARGB(255, 2, 47, 17),
// //                                 foregroundColor: Color.fromARGB(255, 155, 210, 48),
// //                               ),
// //                               onPressed: _googleSignIn,
// //                               child: Text(
// //                                 "Google Login",
// //                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                       SizedBox(height: 24),
// //                       Spacer(),
// //                       Row(
// //                         children: [
// //                           Spacer(),
// //                           Text("Don't have an account? "),
// //                           TextButton(
// //                             onPressed: () {},
// //                             child: Text(
// //                               "Sign Up",
// //                               style: TextStyle(
// //                                 color: Colors.green,
// //                                 fontWeight: FontWeight.bold,
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }


// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:graduation/utils/shared_prefs.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:math';
// import '../widgets/app_drawer.dart';

// class LoginScreen extends StatefulWidget {
//   LoginScreen({super.key});

//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final phoneController = TextEditingController();
//   final otpController = TextEditingController();

//   bool _isLoggedIn = false;
//   String? _generatedOTP;
//   bool _isLoading = false;

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final GoogleSignIn _googleSignIn = GoogleSignIn();

//   @override
//   void initState() {
//     super.initState();
//     _checkLoginStatus();
//   }

//   void _checkLoginStatus() async {
//     SharedPrefs preferences = await SharedPrefs.getInstance();
//     bool isLoggedIn = preferences.getBool('isLoggedIn') ?? false;
//     if (isLoggedIn) {
//       Navigator.pushReplacementNamed(context, '/home');
//     }
//   }

//   Future<void> _googleSignIn() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       if (googleUser != null) {
//         final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
//         final AuthCredential credential = GoogleAuthProvider.credential(
//           accessToken: googleAuth.accessToken,
//           idToken: googleAuth.idToken,
//         );

//         UserCredential userCredential = await _auth.signInWithCredential(credential);
//         User? user = userCredential.user;

//         if (user != null) {
//           String firstName = user.displayName?.split(" ")[0] ?? 'FirstName';
//           String lastName = user.displayName?.split(" ")[1] ?? 'LastName';
//           _saveLoginState();
//           Navigator.pushReplacementNamed(context, '/home', arguments: {'firstName': firstName, 'lastName': lastName});
//         }
//       }
//     } catch (error) {
//       print("Google Sign-In error: $error");
//     }
//   }

//   void _generateOTP() {
//     setState(() {
//       _generatedOTP = (Random().nextInt(9000) + 1000).toString();
//     });
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Your OTP"),
//         content: Text(_generatedOTP!),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text("OK"),
//           ),
//         ],
//       ),
//     );
//   }

//   void _verifyOTP() {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//       });
//       Future.delayed(Duration(seconds: 3), () {
//         setState(() {
//           _isLoading = false;
//         });
//         if (otpController.text == _generatedOTP) {
//           _saveLoginState();
//           Navigator.pushReplacementNamed(context, '/home', arguments: {'phoneNumber': phoneController.text});
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incorrect OTP")));
//         }
//       });
//     }
//   }

//   Future<void> _saveLoginState() async {
//     SharedPrefs prefs = await SharedPrefs.getInstance();
//     await prefs.setBool('isLoggedIn', true);
//   }

//   @override
//   void dispose() {
//     phoneController.dispose();
//     otpController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 2, 47, 17),
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       drawer: AppDrawer(
//         onLogout: () async {
//           SharedPrefs prefs = await SharedPrefs.getInstance();
//           await prefs.setBool('isLoggedIn', false);
//         },
//         firstName: 'tasneem',
//         lastName: 'hesham',
//         phoneNumber: '555555555',
//       ),
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: MediaQuery.of(context).size.height,
//           width: MediaQuery.of(context).size.width,
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 50),
//               ),
//               Spacer(),
//               Container(
//                 padding: EdgeInsets.all(20),
//                 height: MediaQuery.of(context).size.height * 2 / 3,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 155, 210, 84),
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
//                 ),
//                 child: Form(
//                   key: _formKey,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       const Text(
//                         "LOGIN",
//                         style: TextStyle(
//                           fontSize: 40,
//                           fontWeight: FontWeight.bold,
//                         ),
//                         textAlign: TextAlign.center,
//                       ),
//                       SizedBox(height: 12),
//                       TextFormField(
//                         controller: phoneController,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.phone),
//                           hintText: "Phone Number",
//                           fillColor: Colors.white,
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(width: 1),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         keyboardType: TextInputType.phone,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your phone number';
//                           }
//                           if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
//                             return 'Please enter a valid phone number';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 12),
//                       TextFormField(
//                         controller: otpController,
//                         decoration: InputDecoration(
//                           prefixIcon: Icon(Icons.lock),
//                           hintText: "OTP Number",
//                           fillColor: Colors.white,
//                           filled: true,
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(width: 1),
//                             borderRadius: BorderRadius.circular(30),
//                           ),
//                         ),
//                         keyboardType: TextInputType.number,
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter the OTP';
//                           }
//                           return null;
//                         },
//                       ),
//                       SizedBox(height: 12),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 16.0),
//                           child: SizedBox(
//                             width: 150,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 elevation: 10,
//                                 backgroundColor: Color.fromARGB(255, 2, 47, 17),
//                                 foregroundColor: Color.fromARGB(255, 155, 210, 48),
//                               ),
//                               onPressed: _generateOTP,
//                               child: Text(
//                                 "Generate OTP",
//                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: SizedBox(
//                             width: 230,
//                             child: _isLoading
//                                 ? SizedBox(
//                                     width: 24,
//                                     height: 24,
//                                     child: CircularProgressIndicator(
//                                       strokeWidth: 2.0,
//                                       color: Color.fromARGB(255, 2, 47, 17),
//                                     ),
//                                   )
//                                 : ElevatedButton(
//                                     style: ElevatedButton.styleFrom(
//                                       elevation: 10,
//                                       backgroundColor: Color.fromARGB(255, 2, 47, 17),
//                                       foregroundColor: Color.fromARGB(255, 155, 210, 48),
//                                     ),
//                                     onPressed: _verifyOTP,
//                                     child: Text(
//                                       "Verify OTP",
//                                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//                                     ),
//                                   ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 8.0),
//                           child: SizedBox(
//                             width: 230,
//                             child: ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                 elevation: 10,
//                                 backgroundColor: Color.fromARGB(255, 2, 47, 17),
//                                 foregroundColor: Color.fromARGB(255, 155, 210, 48),
//                               ),
//                               onPressed: _googleSignIn,
//                               child: Text(
//                                 "Google Login",
//                                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 24),
//                       Spacer(),
//                       Row(
//                         children: [
//                           Spacer(),
//                           Text("Don't have an account? "),
//                           TextButton(
//                             onPressed: () {},
//                             child: Text(
//                               "Sign Up",
//                               style: TextStyle(
//                                 color: Colors.green,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation/utils/shared_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math';
import '../widgets/app_drawer.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  bool _isLoggedIn = false;
  String? _generatedOTP;
  bool _isLoading = false;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  void _checkLoginStatus() async {
    SharedPrefs preferences = await SharedPrefs.getInstance();
    bool isLoggedIn = preferences.getBool('isLoggedIn') ?? false;
    if (isLoggedIn) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  Future<void> GoogleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential = await _auth.signInWithCredential(credential);
        User? user = userCredential.user;

        if (user != null) {
          String firstName = user.displayName?.split(" ")[0] ?? 'FirstName';
          String lastName = user.displayName?.split(" ")[1] ?? 'LastName';
          _saveLoginState();
          Navigator.pushReplacementNamed(context, '/home', arguments: {'firstName': firstName, 'lastName': lastName});
        }
      }
    } catch (error) {
      print("Google Sign-In error: $error");
    }
  }

  void _generateOTP() {
    setState(() {
      _generatedOTP = (Random().nextInt(9000) + 1000).toString();
    });
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Your OTP"),
        content: Text(_generatedOTP!),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _verifyOTP() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      Future.delayed(Duration(seconds: 3), () {
        setState(() {
          _isLoading = false;
        });
        if (otpController.text == _generatedOTP) {
          _saveLoginState();
          Navigator.pushReplacementNamed(context, '/home', arguments: {'phoneNumber': phoneController.text});
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Incorrect OTP")));
        }
      });
    }
  }

  Future<void> _saveLoginState() async {
    SharedPrefs prefs = await SharedPrefs.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  @override
  void dispose() {
    phoneController.dispose();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 47, 17),
      appBar: AppBar(
        title: Text('Login'),
      ),
      drawer: AppDrawer(
        onLogout: () async {
          SharedPrefs prefs = await SharedPrefs.getInstance();
          await prefs.setBool('isLoggedIn', false);
        },
        firstName: 'tasneem',
        lastName: 'hesham',
        phoneNumber: '555555555',
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height * 2 / 3,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 155, 210, 84),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(60)),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        "LOGIN",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          hintText: "Phone Number",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                            return 'Please enter a valid phone number';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        controller: otpController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          hintText: "OTP Number",
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(width: 1),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the OTP';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 12),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          child: SizedBox(
                            width: 150,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                backgroundColor: Color.fromARGB(255, 2, 47, 17),
                                foregroundColor: Color.fromARGB(255, 155, 210, 48),
                              ),
                              onPressed: _generateOTP,
                              child: Text(
                                "Generate OTP",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            width: 230,
                            child: _isLoading
                                ? SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.0,
                                      color: Color.fromARGB(255, 2, 47, 17),
                                    ),
                                  )
                                : ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      elevation: 10,
                                      backgroundColor: Color.fromARGB(255, 2, 47, 17),
                                      foregroundColor: Color.fromARGB(255, 155, 210, 48),
                                    ),
                                    onPressed: _verifyOTP,
                                    child: Text(
                                      "Verify OTP",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: SizedBox(
                            width: 230,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 10,
                                backgroundColor: Color.fromARGB(255, 2, 47, 17),
                                foregroundColor: Color.fromARGB(255, 155, 210, 48),
                              ),
                              onPressed: _googleSignIn,
                              child: Text(
                                "Google Login",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 24),
                      Spacer(),
                      Row(
                        children: [
                          Spacer(),
                          Text("Don't have an account? "),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GoogleSignIn {
}
