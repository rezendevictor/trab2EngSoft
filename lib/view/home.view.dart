import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecenter/bases/base.view.dart';
import 'package:pokecenter/controller/home.controller.dart';


class HomeView extends BaseViewStateful {


  HomeView({Key key, }) : super(key: key, controller: HomeController());


  @override
  _homeViewState createState() => _homeViewState();
}


class _homeViewState extends BaseViewState {
  @override
  String title() => "Home";

  @override
  Widget body(){
  }

}

