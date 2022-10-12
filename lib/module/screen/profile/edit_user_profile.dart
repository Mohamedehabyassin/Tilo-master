import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tilo/module/screen/profile/user_profile.dart';
import 'package:tilo/shared/network/service/database_service.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool showPassword = false;
  File _image;
  String fullName;
  String userName;
  String phone;
  String address;
  String email;
  DatabaseService _service = DatabaseService();

  //final picker = ImagePicker();

  Future getImage(ImageSource src) async {
    final pickedFile = await ImagePicker().getImage(source: src);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.purple,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Nunito'),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      child: Row(
                        children: [
                          ClipOval(
                            child: Center(
                              child: _image == null
                                  ? Image.asset('assets/profile.jpg')
                                  : Image.file(_image),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.purple,
                        ),
                        child: IconButton(
                          onPressed: () => getImage(ImageSource.gallery),
                          icon: Icon(
                            Icons.add_a_photo,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      fullName = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5),
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        color: Colors.purple),
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      userName = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5),
                    labelText: 'User Name',
                    labelStyle: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        color: Colors.purple),
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5),
                    labelText: 'E-Mail',
                    labelStyle: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        color: Colors.purple),
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  onChanged: (value) {
                    phone = value;
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5),
                    labelText: 'Phone',
                    labelStyle: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        color: Colors.purple),
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      address = value;
                    });
                  },
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(bottom: 5),
                    labelText: 'Address',
                    labelStyle: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        color: Colors.purple),
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    child: Text("SAVE", style: TextStyle(fontSize: 16)),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.purple),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                          side: BorderSide(color: Colors.purple),
                        ),
                      ),
                    ),
                    onPressed: () async {
                      await _service.updateUserData(
                          userName, fullName, email, phone, address);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UserProfileScreen()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
          suffixIcon: isPasswordTextField
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  icon: Icon(
                    Icons.remove_red_eye,
                    color: Colors.grey,
                  ),
                )
              : null,
          contentPadding: EdgeInsets.only(bottom: 5),
          labelText: labelText,
          labelStyle: TextStyle(
              fontFamily: 'Nunito', fontSize: 20, color: Colors.purple),
          //floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: placeholder,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ),
    );
  }
}
