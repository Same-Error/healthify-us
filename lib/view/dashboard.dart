import 'package:flutter/material.dart';
import 'package:healthify_us/controler/healthy_controller.dart';
import 'package:healthify_us/view/dashboardDetails.dart';
import 'package:healthify_us/view/login.dart';
import 'package:healthify_us/view/profile.dart';
import 'package:provider/provider.dart';

import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  void clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.setBool('isLoggedIn', false);
  }

  @override
  void initState() {
    super.initState();
    context.read<HealthyController>().gethealthyData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.amber.withOpacity(0.5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/dp.png"),
                    radius: 40,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text("Sameer", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.amber.withOpacity(0.5),
              ),
              title: Text("Profile"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.amber.withOpacity(0.5),
              ),
              title: Text("Settings"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {},
            ),
            SizedBox(
              height: 300,
            ),
            ElevatedButton(
              onPressed: () {
                clearData();
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
              child: Text(
                "Logout",
                style: TextStyle(color: Colors.black),
              ),
              style: ElevatedButton.styleFrom(
                side: BorderSide(color: Colors.amber),
                elevation: 1,
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "Healthy Recipes",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: context.watch<HealthyController>().getPost == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : context.watch<HealthyController>().getPost!.isEmpty
                ? Text("No Data ")
                : GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        childAspectRatio: 1.2),
                    children: [
                      for (var i
                          in context.watch<HealthyController>().getPost!) ...[
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DashboartdDetails(getPost: i),
                              ),
                            );
                          },
                          child: Card(
                            child: Container(
                              height: 200,
                              width: MediaQuery.sizeOf(context).width / 2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(i.postImage!),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            elevation: 4,
                          ),
                        )
                      ]
                    ],
                  ),
      ),
    );
  }
}
