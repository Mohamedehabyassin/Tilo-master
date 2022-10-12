import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tilo/module/screen/details_screen.dart';
import 'package:tilo/shared/common_widget/common_widget.dart';
import 'package:tilo/shared/provider/data_provider.dart';

class MenScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = Provider.of<DataProvider>(context).menData;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text('Men Section',
              style: TextStyle(
                  color: Colors.grey[600],
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.purple),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        backgroundColor: Colors.white,
        body: (list.isNotEmpty)
            ? ListView.separated(
                itemCount: list.length,
                separatorBuilder: (ctx, index) => Divider(indent: 30,endIndent:30,thickness: 1),
                itemBuilder: (ctx, index) {
                  return itemBuilder(list[index], context);
                })
            : Center(child: SpinKitCubeGrid(color: Colors.purple, size: 50.0)));
  }
}
