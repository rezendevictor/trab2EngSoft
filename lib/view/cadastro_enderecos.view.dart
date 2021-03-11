import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecenter/bases/base.view.dart';
import 'package:pokecenter/controller/home.controller.dart';


class CadastroView extends BaseViewStateful {


  CadastroView({Key key, }) : super(key: key, controller: HomeController());


  @override
  _CadastroViewState createState() => _CadastroViewState();
}


class _CadastroViewState extends BaseViewState {
  @override
  String title() => "Cadastro de Endereços";

  @override
  Widget body(){
    Text("Cadastro");
  }

}

