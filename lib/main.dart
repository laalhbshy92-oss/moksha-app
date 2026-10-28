import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: ProfilePage(), debugShowCheckedModeBanner: false));

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A0B2E),
      body: SafeArea(
        child: Column(
          children: [
            // Top Profile
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  CircleAvatar(radius: 40, backgroundImage: NetworkImage('https://i.pravatar.cc/150')),
                  SizedBox(height: 10),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Icon(Icons.male, color: Colors.blue, size: 16),
                    Text(" موكشه 🇪🇬", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ]),
                  Text("ID:7495971", style: TextStyle(color: Colors.grey)),
                  SizedBox(height: 20),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    _stat("1165", "الزائرون"),
                    _stat("62", "المعجبين"),
                    _stat("35", "يتابعون"),
                    _stat("26", "الأصدقاء"),
                  ]),
                ],
              ),
            ),
            // SVIP Banner
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.brown, Colors.black]),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(children: [
                Expanded(child: Text("SVIP Club\nفتح المزيد من الامتيازات <<", style: TextStyle(color: Colors.amber))),
                Icon(Icons.shield, color: Colors.amber, size: 50),
              ]),
            ),
            _menuItem("المحفظة"), _menuItem("غرفتي"), _menuItem("الوكالة"), _menuItem("متجر"), _menuItem("الإعدادات"),
          ],
        ),
      ),
    );
  }
  Widget _stat(String num, String label) => Column(children: [Text(num, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22)), Text(label, style: TextStyle(color: Colors.grey, fontSize: 12))]);
  Widget _menuItem(String title) => ListTile(title: Text(title, style: TextStyle(color: Colors.white), textAlign: TextAlign.right), trailing: Icon(Icons.arrow_back_ios, color: Colors.grey, size: 16));
}
