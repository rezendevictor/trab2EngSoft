import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecenter/bases/base.view.dart';
import 'package:pokecenter/controller/login.controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:pokecenter/globals.dart' as globals;

class LoginView extends BaseViewStateful {
  LoginView({
    Key key,
  }) : super(key: key, controller: LoginController());

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends BaseViewState {
  final TextEditingController _controllerEmail = new TextEditingController();
  final TextEditingController _controllerSenha = new TextEditingController();
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  @override
  String title() => "Fazer Login";

  @override
  Widget body() {
    return Column(
      children: <Widget>[login(context)],
    );
  }

  Widget login(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 50),
      child: Center(
        child: SizedBox(
          width: 400,
          height: 230,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(30)),
                  color: Colors.white
            ),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top:15.0,bottom: 8.0,left: 8.0,right: 8.0),
                child: TextField(
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                  obscureText: false,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Email",
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  obscureText: true,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Password",
                      border:
                          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blueGrey,
                  child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      onPressed: () {
                        globals.isLoggedIn = true;
                      },
                      child: Text("Login",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,),
                          textAlign: TextAlign.center)),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
