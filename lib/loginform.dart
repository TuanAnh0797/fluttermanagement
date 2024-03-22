import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:managerrestaurant/main.dart';
import 'package:passwordfield/passwordfield.dart';

class loginform extends StatefulWidget {
  const loginform({super.key});

  @override
  State<loginform> createState() => _loginformState();
}

class _loginformState extends State<loginform> {
  final _user = TextEditingController();
  final _password = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _user.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //
        // ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(100, 64, 58, 239),
                Color.fromARGB(120, 20, 180, 145),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/pngimage/logo.png'),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    Text('TÙY YẾN BAKERY',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: Colors.brown[500],
                            decoration: TextDecoration.overline)),
                    const Padding(padding: EdgeInsets.only(top: 30)),
                    TextField(

                      controller: _user,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                      decoration: const InputDecoration(
                        hintText: 'User Name',
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.only(
                            top: 0, bottom: 0, left: 5, right: 5),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey)),
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    PasswordField(
                      controller: _password,
                      color: Colors.grey,

                      passwordConstraint: r'[a-zA-Z]',
                      hintText: 'Password',
                      border:
                          PasswordBorder(border: const OutlineInputBorder()),
                      passwordDecoration: PasswordDecoration(
                          inputStyle: const TextStyle(
                              fontSize: 20, fontStyle: FontStyle.italic),
                          inputPadding: const EdgeInsets.only(
                              top: 0, bottom: 0, left: 5, right: 5)),

                      //errorMessage: 'must contain special character either . * @ # \$',
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    IconButton(
                        iconSize: 100,
                        onPressed: () {
                          if(_user.text == 'tuananh' && _password.text == 'abc'){
                            Navigator.popAndPushNamed(context, listroute[1]);
                          }
                          else{
                            //showDialog(context: context, builder: (ctx)=>const AlertDialog(title: Text('Thông báo'),content: Text('Tài khoản không đúng'),));
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Tài khoản không đúng'),
                                showCloseIcon: true,

                              )
                              );

                          }

                        },
                        icon: SvgPicture.asset('assets/svgicon/login.svg'))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
