import 'package:flutter/material.dart';
import 'package:pokecenter/bases/base.view.dart';
import 'package:pokecenter/controller/galeria.controller.dart';




class GaleriaView extends BaseViewStateful {

  GaleriaView({Key key}) : super(key: key, controller: GaleriaController());

  @override
  _galeriaViewState createState() => _galeriaViewState();
}


class _galeriaViewState extends BaseViewState<GaleriaView> {

  GaleriaController _controller = new GaleriaController();

  @override
  title() => "Galeria";

  @override
  Widget body() {
    return Column(
      children: [
        Text("data"),
        photosList(),
      ],
    );
  }


  Widget photosList(){
    return ListView.builder(
      itemCount: _controller.galeryPhotos.length,
      itemBuilder: (context, index) {
        return Image.network(_controller.galeryPhotos[index]);
      },
    );
  }



}
