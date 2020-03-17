import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'choice.dart';

class AvlUsers extends StatefulWidget {
  String username;
  String phone;

  AvlUsers({Key key, this.username, this.phone}) : super(key: key);

  @override
  _AvlUsersState createState() => _AvlUsersState(username, phone);
}

class _AvlUsersState extends State<AvlUsers> {
  String username;
  String phone;

  _AvlUsersState(this.username, this.phone);

  List<String> getListItems() {
    var items = List.generate(
        username.length, (username) => "Username: ${this.username}");
    return items;
  }

  Widget getListView() {
    var listItems = getListItems();
    ListView listView = ListView.builder(
        itemCount: getListItems().length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listItems[index]),
          );
        });
    return listView;
  }

  checkLength() {
    if (this.username != null) {
      return Container(
        child: Center(
            child: Text(
          "No Clients Yet",
          style: TextStyle(fontSize: 20.0),
        )),
      );
    } else {
      return getListView();
    }
  }

  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: primary,
          title: this.username == null
              ? Text("Welcome ")
              : Text("Welcome $username"),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primary,
          elevation: 2.0,
          tooltip: "Add a Client",
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Center(
                  child: Text('AddClient Screen Stub!!!'),
                );
              }));
            });
          },
        ),
        body: Container(
          // child: UsersList(username: username, phone: phone, chk: checkLength),
          // child: checkLength(),
        ),
        drawer: Drawer(
          elevation: 0,
          child: ListView(
            children: <Widget>[
              Container(
                height: 210,
                child: DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        primary,
                        new Color(0x516d3e),
                      ],
                    ),
                  ),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "img/1.jpg",
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "User Name",
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              CustomListTile(Icons.person, "Add new Client"),
              SizedBox(height: 8.0),
              CustomListTile(Icons.camera_alt, "Upload Picture"),
              SizedBox(height: 8.0),
              CustomListTile(Icons.category, "Category"),
              SizedBox(height: 8.0),
              // CustomListTile(Icons.settings, "Settings"),
              // SizedBox(height: 8.0),
              CustomListTile(Icons.apps, "About App"),
              SignOut(Icons.lock, Colors.red, "LogOut"),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;

  CustomListTile(this.icon, this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    SystemChrome.setEnabledSystemUIOverlays([]);

    var _blankFocusNode = FocusNode();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(_blankFocusNode);
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
        child: Container(
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.black87)),
          ),
          child: InkWell(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Icon(icon),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            splashColor: Colors.black12,
            onTap: () {
              Navigator.pop(context);
              if (title == 'Add new Client') {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Center(
                      child: Text(
                          "Add Client Screen Stub")); //TODO Replace the Stub
                }));
              } else if (title == 'Upload Picture') {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Center(
                      child: Text(
                          "Upload Image Screen Stub")); //TODO Replace the Stub
                }));
              } else if (title == 'Category') {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Center(
                      child: Text(
                          "Add Category Stub Screen Stub")); //TODO Replace The Stub
                }));
              } else if (title == 'Settings') {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Center(
                      child:
                          Text("Settings Screen Stub")); //TODO Replace The Stub
                }));
              } else if (title == 'About App') {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Center(
                      child: Text(
                          "About App Screen Stub")); //TODO Replace The Stub
                }));
              }
            },
          ),
        ),
      ),
    );
  }
}

class SignOut extends StatelessWidget {
  final String title;
  final Color color;
  final IconData icon;

  SignOut(this.icon, this.color, this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    SystemChrome.setEnabledSystemUIOverlays([]);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
      child: Container(
        child: InkWell(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Icon(
                icon,
                color: Colors.red,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: Row(
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          splashColor: Colors.red,
          onTap: () {
            _showAlert(context);
          },
        ),
      ),
    );
  }
}

_showAlert(BuildContext context) {
  Color primary = Theme.of(context).primaryColor;
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you sure you want to logOut ?"),
          actions: <Widget>[
            FlatButton(
              color: primary,
              child: Text(
                "No ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pop(context, false);
              },
            ),
            FlatButton(
              color: primary,
              child: Text(
                "Yes ",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Choice();
                }));
              },
            ),
          ],
        );
      });
}
