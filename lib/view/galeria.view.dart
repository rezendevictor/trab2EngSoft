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
    return  photosList();
  }

  Widget photosList() {
    return Padding(
      padding: EdgeInsets.only(left:20.0,right: 20),
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20, childAspectRatio: 3/2),
          itemCount: _controller.galeryPhotos.length,
          itemBuilder: (BuildContext context, int index) {
            return new GridTile(
              child: Image(
                image: AssetImage('${_controller.galeryPhotos[index]}'),
              ),
            );
          }),
    );
  }
}
