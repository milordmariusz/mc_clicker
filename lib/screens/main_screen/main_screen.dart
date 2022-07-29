import 'package:authwithrest/bloc/auth_bloc/auth.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:authwithrest/style/theme.dart' as Style;

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int counter = 0;
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
    List<Widget> _widgetOptions = <Widget>[
      Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
            ),
            IconButton(
              //TODO
              onPressed: () {
                _incrementCounter();
              },
              icon: Icon(Icons.call_made_rounded),
              iconSize: 150,
              splashColor: Colors.transparent,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              counter.toString(),
              style: TextStyle(
                  fontSize: 60 * MediaQuery.of(context).textScaleFactor),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
          ],
        ),
      ),
      Center(
        child: ListView(//TODO
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ListTile(
                title: Text("Item 1"),
                subtitle: Text("Placeholder info"),
                leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://cdn.icon-icons.com/icons2/1678/PNG/512/wondicon-ui-free-parcel_111208.png")),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Item 2"),
                subtitle: Text("Placeholder info"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.icon-icons.com/icons2/1678/PNG/512/wondicon-ui-free-parcel_111208.png"),
                ),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Item 3"),
                subtitle: Text("Placeholder info"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.icon-icons.com/icons2/1678/PNG/512/wondicon-ui-free-parcel_111208.png"),
                ),
                trailing: Icon(Icons.star)),
            ListTile(
                title: Text("Item 4"),
                subtitle: Text("Placeholder info"),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://cdn.icon-icons.com/icons2/1678/PNG/512/wondicon-ui-free-parcel_111208.png"),
                ),
                trailing: Icon(Icons.star))
          ],
        ),
      ),
      Text(
        //TODO
        'Account',
        style: optionStyle,
      ),
      Text(
        //TODO
        'Settings',
        style: optionStyle,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.Colors.mainColor,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage("https://reqres.in/img/faces/2-image.jpg" //TODO
                    ),
          ),
        ),
        title: Text("Clicker"),
        actions: [
          IconButton(
            icon: Icon(EvaIcons.logOutOutline),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(
                LoggedOut(),
              );
            },
          )
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Shop',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Account',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
