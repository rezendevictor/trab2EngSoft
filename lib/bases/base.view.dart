import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecenter/bases/base.controller.dart';
import 'package:pokecenter/view/cadastro_enderecos.view.dart';
import 'package:pokecenter/view/home.view.dart';
import 'package:pokecenter/view/login.view.dart';

abstract class BaseViewStateful<Controller extends BaseController>
    extends StatefulWidget {
  final Controller controller;

  BaseViewStateful({Key key, this.controller}) : super(key: key);
}

abstract class BaseViewState<View extends BaseViewStateful>
    extends State<View> {
  String title() => null;

  Widget floatingActionButton() => null;

  Widget body();

  void onBuild() => null;

  @override
  Widget build(BuildContext context) {
    onBuild();
    return WillPopScope(
      child: Scaffold(
        appBar: AppBar(title: Text(this.title()), actions: [_loginButton(context)],),
        drawer: _sidebar(context),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Container(
                child: body(),
              ),

            ],
          ),
        ),
        floatingActionButton: floatingActionButton(),
      ),
    );
  }


}

Widget _sidebar(BuildContext context) {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text(
            'Menu de Navegação',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          decoration: BoxDecoration(
              color: Colors.pink,
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/cover.jpg'))),
        ),
        ListTile(
          leading: Icon(Icons.house),
          title: Text('Home'),
          onTap: () => {navigation(HomeView(), context)},
        ),
        ListTile(
          leading: Icon(Icons.photo),
          title: Text('Galeria'),
          onTap: () => {navigation(HomeView(), context)},
        ),
        ListTile(
          leading: Icon(Icons.border_color),
          title: Text('Cadastro Endereços'),
          onTap: () => {navigation(CadastroView(), context)},
        ),
        ListTile(
          leading: Icon(Icons.border_color),
          title: Text('Cadastro Endereços'),
          onTap: () => {navigation(CadastroView(), context)},
        ),
        ListTile(
          leading: Icon(Icons.border_color),
          title: Text('Agendamento'),
          onTap: () => {navigation(CadastroView(), context)},
        ),
        ListTile(
          leading: Icon(Icons.border_color),
          title: Text('Cadastro de Funcionários'),
          onTap: () => {navigation(CadastroView(), context)},
        ),
        ListTile(
          leading: Icon(Icons.border_color),
          title: Text('Cadastro de Pacientes'),
          onTap: () => {navigation(CadastroView(), context)},
        ),
        ListTile(
          leading: Icon(Icons.border_color),
          title: Text('Listagens'),
          onTap: () => {navigation(CadastroView(), context)},
        ),
      ],
    ),
  );
}


Widget _loginButton(BuildContext context) {
  return IconButton(
      icon: const Icon(Icons.assignment_ind_outlined),
      tooltip: 'Fazer Login',
      onPressed: () {navigation(LoginView(), context);}
    );
}

void navigation(BaseViewStateful caminho, BuildContext context) {
  Navigator.of(context).pop();
  Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => caminho));
}


