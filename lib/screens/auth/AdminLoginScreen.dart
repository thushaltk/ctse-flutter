import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:humanoid_ctse/models/http_exception.dart';
import 'package:humanoid_ctse/screens/DashboardAdminScreen.dart';
import 'package:humanoid_ctse/screens/auth/AdminSignupScreen.dart';
import 'package:humanoid_ctse/services/AuthServices.dart';
import 'package:provider/provider.dart';

import '../../widgets/NavigationDrawerWidget.dart';

class AdminLoginScreen extends StatefulWidget {
  static const routeName = '/admin-login';

  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isLoading = false;

  Future<void> onSubmit() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await Provider.of<AuthService>(context, listen: false)
          .login(_emailController.text, _passwordController.text);
      Navigator.of(context).pushNamed(DashboardAdminScreen.routeName);
    } on HttpException catch (error) {
      var errorMessage = "Authentication Failed!";
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email is already in use!';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This email is invalid!';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'Weak password!';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Email not found!';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Password is incorrect!';
      }
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } catch (error) {
      var errorMessage = "Could not authenticate you. Please try again later.";
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawyerWidget(),
        appBar: AppBar(
            foregroundColor: Colors.white,
            toolbarHeight: 80,
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text('Admin Login')),
        body: Consumer<AuthService>(
          builder: (ctx, auth, _) => SingleChildScrollView(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                      ),
                      const Text("ADMIN")
                    ]),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                      child: ListView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    children: <Widget>[
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(labelText: 'Email'),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        enableSuggestions: false,
                        autocorrect: false,
                        decoration:
                            const InputDecoration(labelText: 'Password'),
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          if (_isLoading)
                            Column(
                              children: [
                                ConstrainedBox(
                                    constraints: const BoxConstraints.tightFor(
                                        width: 45, height: 45),
                                    child: const CircularProgressIndicator()),
                              ],
                            )
                          else
                            ConstrainedBox(
                              constraints: const BoxConstraints.tightFor(
                                  width: double.infinity, height: 45),
                              child: ElevatedButton(
                                onPressed: () {
                                  onSubmit();
                                },
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.0),
                                        side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 1, 77, 123)))),
                                child: const Text("LOGIN"),
                              ),
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          ConstrainedBox(
                            constraints: const BoxConstraints.tightFor(
                                width: double.infinity, height: 45),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(AdminSignupScreen.routeName);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 1, 77, 123)))),
                              child: const Text(
                                "GO TO SIGNUP",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 1, 77, 123)),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
                )
              ],
            ),
          ),
        ));
  }
}
