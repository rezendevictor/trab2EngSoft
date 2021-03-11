import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokecenter/bases/base.view.dart';
import 'package:pokecenter/controller/listagem.controller.dart';

class ListagemView extends BaseViewStateful {

  ListagemView({Key key}) : super(key: key, controller: ListagemController());

  @override
  _listagemViewState createState() => _listagemViewState();
}


class _listagemViewState extends BaseViewState<ListagemView> {

  ListagemController _controller = new ListagemController();

  @override
  String title() => "Listagem";

  @override
  Widget body() {
    return Column(
      children: [
        _streamLista(),
      ],
    );
  }


Widget _streamLista(){
  StreamBuilder(
    stream: _controller.streamInfos,
    builder: (context, snapshot) {
      return _lista(snapshot.data);
    }
  )
}


Widget _lista(List infos){
  ListView.builder(
    itemCount: infos.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text('${infos[index]}'),
      );
    },
  );

}


Widget _selecionarLista(){


}

}