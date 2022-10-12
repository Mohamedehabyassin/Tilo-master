import 'package:flutter/material.dart';
import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:provider/provider.dart';
import 'package:tilo/model/user_model.dart';
import 'package:tilo/shared/network/service/database_service.dart';


class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserModel>(context);
    return Scaffold(
      body: ChangeNotifierProvider<DatabaseService>(
        create: (context) => DatabaseService(),
        child: Consumer<DatabaseService>(
          builder: (ctx, user, _) {
            print(user.userData);
            return (_user != null && user.userData != null)
                ? Column(
                    children: [
                      SingleChildScrollView(
                        child: Container(
                          height: 300,
                          child: Stack(
                            children: [
                              ClipPath(
                                clipper: MyCustomClipper(),
                                child: Container(
                                  height: 250.00,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          'https://mocah.org/uploads/posts/515287-4K-Pink-Girly.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Align(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(
                                      height: 90,
                                    ),
                                    CircularProfileAvatar(
                                      'https://resizing.flixster.com/2ubbDHZSk_6-Ffxoyf_dcNDRVWY=/506x652/v2/https://flxt.tmsimg.com/v9/AllPhotos/165127/165127_v9_bb.jpg',
                                      borderWidth: 3.0,
                                      radius: 70.0,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      '${user.userData['fullName']}',
                                      style: TextStyle(
                                        fontFamily: 'Nunito',
                                        color: Colors.purple,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SafeArea(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        }),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: [
                          Card(
                            child: ListTile(
                              leading: Text(
                                'Username: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                '${user.userData['userName']}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(500, 117, 117, 117),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Text(
                                'Phone: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                '+${user.userData['phone']}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(500, 117, 117, 117),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Text(
                                'Email Address: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                '${user.userData['eMail']}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(500, 117, 117, 117),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Text(
                                'Shipping Address: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                '${user.userData['address']}',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(500, 117, 117, 117),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Card(
                            child: ListTile(
                              leading: Text(
                                'Edit Profile: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: IconButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed('/EditProfileScreen');
                                },
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : Center(
                    child: Text("You must Sign in First "),
                  );
          },
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height - 150);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
