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

        SizedBox(child: _streamLista()),
      ],
    );
  }


  Widget _streamLista() {
    Container(
      child: StreamBuilder(
          initialData: _controller.teste,
          stream: _controller.streamInfos,
          builder: (context, snapshot) {
            return _photosList(snapshot.data);
          }
      ),
    );
  }

  Widget _selectionColumn(){
    return Padding(
      padding: const EdgeInsets.only(top:20.0,right: 20,left: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.circular(200),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0),
          child: Row(
            children: [
              Text("Selecione a lista a ser exibida:",
              style: TextStyle(color: Colors.white,
              fontSize: 20),),
              Padding(
                  padding: EdgeInsets.only(left: 200),
                  child: _streamSelecionarLista()),
            ],
          ),
        ),
      ),
    );
  }



  Widget _streamSelecionarLista() {
    return StreamBuilder(
        stream: _controller.categoriaAtual,
        builder: (context, snapshot) {
          return _selecionarLista(snapshot.data);
        }
    );
  }

  Widget _selecionarLista(String selected) {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 8,bottom: 8),
      child: DropdownButton<String>(
        hint: Text("Selecione Lista"),
        value: selected,
        icon: Icon(Icons.arrow_downward,color: Colors.white,),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(color: Colors.black,fontSize: 18),
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



  Widget _photosList(List lista) {
    return Padding(
      padding: EdgeInsets.only(left:20.0,right: 20),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, childAspectRatio: 3/2),
          itemCount: lista.length,
          itemBuilder: (BuildContext context, int index) {
            return new GridTile(
              child: Text(
                "Teste"
              )
            );
          }),
    );
  }



}
