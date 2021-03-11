import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecenter/bases/base.view.dart';
import 'package:pokecenter/controller/login.controller.dart';
import 'package:rflutter_alert/rflutter_alert.dart';


class LoginView extends BaseViewStateful {


  LoginView({Key key, }) : super(key: key, controller: LoginController());

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
  Widget body(){
    return Column(
      children: [
        _openPopup(context)
      ],
    );
  }

  _openPopup(context) {
    Alert(
        context: context,
        title: "Login",
        content: Column(
          children: <Widget>[
            _emailField(),
            _passwordField(),
          ],
        ),
        buttons: [
          _criarBotaoEntrar()
        ]).show();
  }

  Widget _emailField() {
    return new TextFormField(
      controller: _controllerEmail,
      maxLength: 100,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      validator: (email) => widget.controller.validarEmail(email),
      onSaved: (email) =>{},
    );
  }
  Widget _passwordField() {
    return new TextFormField(
        controller: _controllerSenha,
        maxLength: 100,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
    hintText: "Password",
    border:
    OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    validator: (senha) => widget.controller.validarSenha(senha),
    onSaved: (email) =>{});
  }

  Widget _criarBotaoEntrar() {
   return ElevatedButton(
     child: Center(child: Text("Entrar")),
     onPressed: _entrar,
   );
  }

  void _entrar() async {
    if (!_formKey.currentState.validate()) {
      return null;
    }

    _formKey.currentState.save();

    //bool sucesso = await widget.controller.autenticarComEmail();

    Navigator.of(context).pop();
  }

}

