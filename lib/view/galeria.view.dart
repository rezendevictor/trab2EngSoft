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
  List<String> litems = ["1", "2", "Third", "4"];

  @override
  title() => "Galeria";

  @override
  Widget body() {
    return  photosList();
  }

  Widget photosList() {
    return Padding(
      padding: EdgeInsets.only(left:20.0,right: 20),
      child: Expanded(
        child: ListView(
          children: [
            Center(
              child: ListView.builder(
                  itemCount: litems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text('${litems[index]}'),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
