import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tilo/module/screen/details_screen.dart';
import 'package:tilo/shared/provider/data_provider.dart';

class BabyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var list = Provider.of<DataProvider>(context).babyData;

    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text('Babies Section',
                style: TextStyle(
                    color: Colors.grey[600],
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold)),
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.purple),
                onPressed: () => Navigator.of(context).pop())),
        body: (list.isNotEmpty)
            ? ListView.builder(
                itemCount: list.length,
                itemBuilder: (ctx, index) {
                  return Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[100],
                      ),
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Image.network(
                                    "${list[index].images[0].url}"),
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              flex: 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${list[index].name}",
                                    style: TextStyle(
                                      color: Colors.purple,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      fontFamily: 'Nunito',
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Text(
                                    "${list[index].whitePrice.value} EGP",
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton.icon(
                                        //child
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.white),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.purple),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                              side: BorderSide(
                                                  color: Colors.purple),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailsScreen(
                                                item: list[index],
                                              ),
                                            ),
                                          );
                                        },
                                        icon: Icon(EvaIcons.list),
                                        label: Text("More Details",
                                            style: TextStyle(fontSize: 16)),
                                      ),
                                    ],
                                  ),
                                ],
                              ))
                        ],
                      ));
                })
            : Center(child: SpinKitCubeGrid(color: Colors.purple, size: 50.0)));
  }
}
