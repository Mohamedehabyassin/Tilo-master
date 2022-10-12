import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:tilo/model/data_model.dart';
import 'package:tilo/module/screen/details_screen.dart';

Widget buildTextField(IconData icon, String hintText, bool isPassword, bool isEmail) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 9.0),
    child: TextField(
      obscureText: isPassword,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.purple,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.purple),
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          contentPadding: EdgeInsets.all(10),
          hintText: hintText,
          hintStyle: TextStyle(fontFamily: 'Nunito', fontSize: 20)),
    ),
  );
}

TextButton buildTextButton(
    IconData icon, String title, Color backgroundColor) {
  return TextButton(
    onPressed: () {},
    style: TextButton.styleFrom(
      foregroundColor: Colors.white, side: BorderSide(width: 1, color: Colors.grey),
      minimumSize: Size(155, 40),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      backgroundColor: backgroundColor,
    ),
    child: Row(
      children: [
        Icon(icon),
        SizedBox(width: 5),
        Text(
          title,
          style: TextStyle(fontFamily: 'Nunito', fontSize: 17),
        ),
      ],
    ),
  );
}


Widget itemBuilder(Result item,BuildContext context) => Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: Colors.grey[100],
    ),
    margin: EdgeInsets.symmetric(vertical: 5,horizontal: 20),
    child: Row(
      children: [
        Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.network(
                  "${item.images[0].url}"),
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
                  "${item.name}",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Nunito',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${item.whitePrice.value} EGP",
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
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
                                  item: item,
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