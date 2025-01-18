import 'package:flutter/material.dart';
import 'package:healthy_recipies/controler/halty.controller.dart';
import 'package:healthy_recipies/view/dashboardDetails.dart';
import 'package:healthy_recipies/view/login.dart';
import 'package:healthy_recipies/view/profile.dart';
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
  }

  @override
  void initState() {
    context.read<HealthyController>().gethealthyData();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              DrawerHeader(
                  decoration:
                      BoxDecoration(color: Colors.pinkAccent.withOpacity(0.5)),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/saad.png"),
                            radius: 40,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("Saad Bhujwala")
                        ],
                      )
                    ],
                  )),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Colors.pinkAccent.withOpacity(0.5),
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
                  color: Colors.pink.withOpacity(0.5),
                ),
                title: Text("Settings"),
                trailing: Icon(Icons.arrow_forward),
              ),
              SizedBox(
                height: 400,
              ),
              ElevatedButton(
                onPressed: () {
                  clearData();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  "Logout",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent.withOpacity(0.5)),
              )
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.pinkAccent,
          title: Text(
            "Healthy Recipe",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background2.png"),
                  fit: BoxFit.fill)),
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
                                          DashboartdDetails(getPost: i)));
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                        i.postImage!,
                                      ),
                                      fit: BoxFit.fitWidth)),
                            ),
                          )
                        ]
                      ],
                    ),
        ));
  }
}
