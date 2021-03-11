import 'package:flutter/material.dart';
import 'package:pokecenter/Controller/galeria.controller.dart';

class GaleriaView extends StatelessWidget {
  GaleriaController controller = new GaleriaController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Galeria"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext ctx, int index) {
          return Image.network(controller.galeryPhotos[index]);
        },
        itemCount: controller.galeryPhotos.length,
      ),
    );
  }
}