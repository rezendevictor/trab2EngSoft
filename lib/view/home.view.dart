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
    return Column(
      children: [
        _titulo(),
        _missao(),
        _foto()
      ],
    );
  }


  Widget _titulo(){
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Center(
        child: Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "PokeCenter Clinica de Tratamentos Gerais",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _missao(){
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Nossa missão é o tratamento de qualidade, com atenção e personalizado,gratuito.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),

            ),
          ),
        ),
      ),
    );
  }

  Widget _foto(){
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Center(
        child: Container(
          width: 800,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image( image: AssetImage("lib/assets/pokecenterFront.jpg"),)
          ),
        ),
      ),
    );
  }






}

