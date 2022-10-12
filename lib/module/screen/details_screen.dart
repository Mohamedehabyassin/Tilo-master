import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:tilo/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:tilo/module/screen/cart/cart_screen.dart';
import 'package:tilo/shared/provider/cart_provider.dart';
import 'package:tilo/shared/provider/details_data_provider.dart';
import 'package:tilo/shared/provider/wishlist_provider.dart';
import 'package:toast/toast.dart';

class DetailsScreen extends StatelessWidget {
  final Result item;

  DetailsScreen({this.item});

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<CartProvider>(context);
    final itemWishListProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              icon: Icon(EvaIcons.shoppingCart,
                  size: 35, color: Colors.deepPurple),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              })
        ],
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.purple),
            onPressed: () => Navigator.of(context).pop()),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(25),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${item.defaultArticle.name}',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontFamily: "Nunito",
                    fontSize: 25,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 18),
              ClipRRect(
                child: Image.network("${item.images[0].url}",
                    fit: BoxFit.fitHeight, height: 350, width: double.infinity),
              ),
              SizedBox(height: 30),
              ChangeNotifierProvider<DetailsDataProvider>(
                  create: (_) => DetailsDataProvider(item.defaultArticle.code),
                  child: Consumer<DetailsDataProvider>(
                    builder: (ctx, _data, _) {
                      return (_data.dataItem != null)
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text(
                                    'Description: ',
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${_data.dataItem.description}",
                                    style: TextStyle(
                                        fontFamily: 'Nunito',
                                        fontSize: 20,
                                        color: Colors.grey[800]),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Category: ',
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${_data.dataItem.mainCategory.name}",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 20,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Price: ',
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${_data.dataItem.whitePrice.price} EGP",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 20,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    'Colors: ',
                                    style: TextStyle(
                                        color: Colors.purple,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  ),
                                  Text(
                                    "${_data.dataItem.color.text}",
                                    style: TextStyle(
                                      fontFamily: 'Nunito',
                                      fontSize: 20,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      IconButton(
                                          icon: Icon(
                                            EvaIcons.plusCircleOutline,
                                            color: Colors.purple,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            Toast.show(
                                                "Product has been added to Cart.",
                                                context,
                                                duration: Toast.LENGTH_LONG,
                                                gravity: Toast.BOTTOM,
                                                backgroundColor: Colors.purple,
                                                textColor: Colors.white);
                                            itemProvider
                                                .addItem(_data.dataItem);
                                          }),
                                      IconButton(
                                          icon: Icon(
                                            Icons.favorite_border,
                                            color: Colors.purple,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            Toast.show(
                                                "Product has been added to Wishlist.",
                                                context,
                                                duration: Toast.LENGTH_LONG,
                                                gravity: Toast.CENTER,
                                                backgroundColor: Colors.purple,
                                                textColor: Colors.white);

                                            itemWishListProvider
                                                .addItem(_data.dataItem);
                                          }),
                                      IconButton(
                                        icon: Icon(
                                          EvaIcons.gift,
                                          color: Colors.purple,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          itemProvider.addItem(_data.dataItem);
                                          Navigator.of(context)
                                              .pushNamed('/GiftScreen');
                                        },
                                      ),
                                    ],
                                  )
                                ])
                          : Center(
                              child: SpinKitCubeGrid(
                                color: Colors.purple,
                                size: 50.0,
                              ),
                            );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
