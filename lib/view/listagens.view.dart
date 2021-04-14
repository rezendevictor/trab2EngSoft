import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:pokecenter/bases/base.view.dart';
import 'package:pokecenter/controller/listagem.controller.dart';

class ListagemView extends BaseViewStateful {

  ListagemView({Key key}) : super(key: key, controller: ListagemController());

  @override
  _listagemViewState createState() => _listagemViewState();
}

class _listagemViewState extends BaseViewState<ListagemView> {

  ListagemController _controller = new ListagemController();
  String selecaoAtual;
  List<dynamic> listData = [];
  @override
  String title() => "Listagem";

  @override
  Widget body() {
    return Column(
      children: [
        _selectionColumn(),
        Expanded(
          child: SizedBox(child: _streamLista()),
        ),
      ],
    );
  }


  Widget _streamLista() {
    return Container(
      child: _photosList(listData),
      // child: StreamBuilder(
      //     initialData: _controller.teste,
      //     stream: _controller.streamInfos,
      //     builder: (context, snapshot) {
      //       return _photosList(snapshot.data);
      //     }
      // ),
    );
  }

  fetchListByCategory(String newValue) async {
    Iterable responseData = await _controller.fetchListByCategory(newValue);

    setState(() {
      selecaoAtual = newValue;
      listData = responseData;
    });
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
                  child: _selecionarLista(selecaoAtual)),
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
          return _selecionarLista(selecaoAtual);
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
          color: Colors.black,
        ),
        onChanged: fetchListByCategory,
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

  Widget _renderDoctor(item){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Nome: "+item['name']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Especialidade: "+item['specialty']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("CRM: "+item['crm']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Cep: "+item['cep']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Logradouro: "+item['street']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Bairro: "+item['complement']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Cidade: "+item['city']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Estado: "+item['state']),
        )
      ],
    );
  }

  Widget _renderEmployee(item){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Nome: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Cep: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Logradouro: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Bairro: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Cidade: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Estado: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Cidade: "+item['title']),
        ),
      ],
    );
  }

  Widget _renderPacient(item){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Nome: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Email: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Peso: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Altura: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Cep: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Logradouro: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Bairro: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Cidade: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Estado: "+item['title']),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text("Cidade: "+item['title']),
        ),
      ],
    );
  }

  Widget _renderItem(item){
    switch(selecaoAtual){
      case 'albums':
      case 'Pacientes':
        return _renderPacient(item);
      case 'Médicos':
      case 'todos':
        return _renderDoctor(item);
      case 'Funcionários':
        return _renderEmployee(item);
      case 'Endereços':
        return _renderDoctor(item);
      case 'Agendamentos':
        return _renderDoctor(item);
      case 'Meus Agendamentos':
        return _renderDoctor(item);
      default:
        return _renderDoctor(item);
    }
  }

  Widget _photosList(List lista) {
    return Padding(
      padding: EdgeInsets.only(left:20.0, right: 20),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, childAspectRatio: 3/2),
          itemCount: lista.length,
          itemBuilder: (BuildContext context, int index) {
            return new GridTile(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                  child: _renderItem(listData[index]),
                )
              )
            );
          }),
    );
  }

}
