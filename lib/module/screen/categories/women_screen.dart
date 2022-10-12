import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tilo/shared/common_widget/common_widget.dart';
import 'package:tilo/shared/provider/data_provider.dart';


class WomenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = Provider.of<DataProvider>(context).womenData;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Women Section',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.purple),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: (list.isNotEmpty)
            ? ListView.builder(
                itemCount: list.length,
                itemBuilder: (ctx, index) {
                  return itemBuilder(list[index],context);
                })
            : Center(child: SpinKitCubeGrid(color: Colors.purple, size: 50.0)));
  }
}
