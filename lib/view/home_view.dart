import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:retail_store/view/auth/login_view.dart';
import 'package:retail_store/view/widgets/custom_text.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 80),
        child: Column(
          children: [
            _searchTextFormField(),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: "Categories",
            ),
            SizedBox(
              height: 20,
            ),
            _listViewCategory(),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  text: "Best Selling",
                  fontSize: 18,
                ),
                CustomText(
                  text: "See All",
                  fontSize: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _searchTextFormField() {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
    child: TextFormField(
      decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
          )),
    ),
  );
}

Widget _listViewCategory() {
  final List<String> names = <String>[
    'men',
    's',
    's',
    's',
    's',
  ];
  return Container(
    height: 120,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: names.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade100),
              height: 60,
              width: 60,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/Icon_Mens Shoe.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomText(
              text: names[index],
            )
          ],
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        width: 10,
      ),
    ),
  );
}
// for sign out method
// ElevatedButton(
        //   onPressed: () {
        //     _auth.signOut();
        //     Get.offAll(LoginView());
        //   },
        //   child: Text("Logout"),
        // ),