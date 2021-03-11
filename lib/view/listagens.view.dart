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
        _streamSelecionarLista(),
        _streamLista(),
      ],
    );
  }


  Widget _streamLista() {
    StreamBuilder(
        stream: _controller.streamInfos,
        builder: (context, snapshot) {
          return _lista(snapshot.data);
        }
    );
  }


  Widget _lista(List infos) {
    ListView.builder(
      itemCount: infos.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('${infos[index]}'),
        );
      },
    );
  }

  Widget _streamSelecionarLista() {
    return StreamBuilder(
        stream: _controller.categoriaAtual,
        initialData: "Selecione a lista",
        builder: (context, snapshot) {
          return _selecionarLista(snapshot.data);
        }
    );
  }


  Widget _selecionarLista(String selected) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 8),
      child: DropdownButton<String>(
        value: selected,
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.black,fontSize: 22),
        underline: Container(
          height: 2,
          color: Colors.red,
        ),
        onChanged: (String newValue) {_controller.categoriaSelecionada(newValue);},
        items: _controller.listasDisponiveis
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

}
