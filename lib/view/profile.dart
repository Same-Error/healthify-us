import 'package:flutter/material.dart';
import 'package:healthify_us/modal/profile_buttons_modal.dart';
import 'package:healthify_us/view/dashboard.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<ProfileButtons> ofOrder = [
    ProfileButtons(name: "Your Orders"),
    ProfileButtons(name: "Membership"),
    ProfileButtons(name: "Account Info"),
    ProfileButtons(name: "Order History"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.amber.withOpacity(0.9),
        actions: [
          Icon(
            Icons.settings,
            color: Colors.black,
          ),
          SizedBox(width: 20),
          Icon(Icons.notifications, color: Colors.black),
          SizedBox(width: 20),
          Icon(
            Icons.search,
            color: Colors.black,
          )
        ],
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 2,
              child: GridView.builder(
                itemCount: ofOrder.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4),
                itemBuilder: (context, i) {
                  return OutlinedButton(
                    onPressed: () {},
                    child: Text(ofOrder[i].name),
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50))),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
              child: Text(
                "Dashboard",
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
    );
  }
}
