import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecenter/bases/base.view.dart';
import 'package:pokecenter/controller/home.controller.dart';
import 'package:spinner/spinner.dart';

class HomeView extends BaseViewStateful {
  HomeView({
    Key key,
  }) : super(key: key, controller: HomeController());

  @override
  _homeViewState createState() => _homeViewState();
}

class _homeViewState extends BaseViewState {
  HomeController _controller = new HomeController();

  @override
  String title() => "Home";

  @override
  Widget body() {
    return Column(
      children: [_titulo(), _missao(), _foto(), _historiasDeSucesso(context)],
    );
  }

  Widget _titulo() {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Center(
        child: Container(
          decoration: BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Asilo Arkham Para Os Mentalmente Instáveis",
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

  Widget _missao() {
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
              "Nossa missão é o tratamento de qualidade, com atenção e personalizado, gratuito.",
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

  Widget _foto() {
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
              child: Image(
                image: AssetImage("lib/assets/pokecenterFront.jpg"),
              )),
        ),
      ),
    );
  }

  Widget _historiasDeSucesso(BuildContext ctx) {
    const int NUM_ELEMENTS = 50;
    const int ON_SCREEN = 10;
    var height = MediaQuery.of(ctx).size.height;
    var width = MediaQuery.of(ctx).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              _card(_controller.rand_say(),"Oswald Cobblepot"),
              _card(_controller.rand_say(),"Oswald Cobblepot"),
              _card(_controller.rand_say(),"Oswald Cobblepot"),
              _card(_controller.rand_say(),"Oswald Cobblepot"),
              _card(_controller.rand_say(),"Oswald Cobblepot"),
              _card(_controller.rand_say(),"Oswald Cobblepot"),
              _card(_controller.rand_say(),"Oswald Cobblepot"),
              _card(_controller.rand_say(),"Oswald Cobblepot"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _card(String review,String name) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0, left: 50,right: 50),
      child: Container(
        height: 600.0,
        width: 240.0,
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage("https://static.wikia.nocookie.net/batman/images/c/ca/ThePenguinDannyDevito.jpg/revision/latest/scale-to-width-down/296?cb=20110723234214",scale: 0.2)),
          title: Text(
            review,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            "-- "+ name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
