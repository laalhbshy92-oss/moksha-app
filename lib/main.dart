import 'package:flutter/material.dart';

void main() => runApp(MokshaVoiceApp());

class MokshaVoiceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final pages = [RoomsPage(), Container(), Container(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex == 0 ? 0 : 3], // مؤقتا
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 70,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Color(0xFF1A0A33), Color(0xFF2D1B4E)]),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Color(0xFFB388FF),
              unselectedItemColor: Colors.white38,
              currentIndex: currentIndex == 0 ? 0 : 3,
              onTap: (i) => setState(() => currentIndex = i == 0 ? 0 : 3),
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
                BottomNavigationBarItem(icon: Stack(children: [Icon(Icons.mail), Positioned(right:0, child: CircleAvatar(radius:8, backgroundColor: Colors.red, child: Text("13", style: TextStyle(fontSize: 8))))]), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.star), label: ""),
              ],
            ),
          ),
          Positioned(
            left: 15, top: -15,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Color(0xFF7C4DFF), borderRadius: BorderRadius.circular(30)),
              child: Row(children: [
                Icon(Icons.power_settings_new, color: Colors.white, size: 20),
                SizedBox(width: 6),
                CircleAvatar(radius: 14, backgroundImage: NetworkImage("https://i.pravatar.cc/100")),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

// صفحة الرومات
class RoomsPage extends StatelessWidget {
  final rooms = [
    {"users": "158421", "title": "وكاله وعد وحاز... 🍑", "img": "https://picsum.photos/300/300?1"},
    {"users": "34977", "title": "كرسي اعتراف مع ام...", "img": "https://picsum.photos/300/300?2"},
    {"users": "20361", "title": "10 دينار مليون و...8", "img": "https://picsum.photos/300/300?3"},
    {"users": "24413", "title": "عيد ميلاد الوكيلة يا...", "img": "https://picsum.photos/300/300?4"},
    {"users": "20799", "title": "سحب وشحن فورى ...", "img": "https://picsum.photos/300/300?5"},
    {"users": "17295", "title": "العسل السايح 🍯", "img": "https://picsum.photos/300/300?6"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF3A1A6B), Color(0xFF15052E)])),
      child: SafeArea(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(children: [
              Icon(Icons.search, color: Colors.white, size: 28),
              Spacer(),
              Text("شائع  عالمي", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
            ]),
          ),
          Container(
            height: 40,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              SizedBox(width: 10),
              _flag("🇪🇬", true), _flag("🇸🇦", false), _flag("🇲🇦", false), _flag("🇩🇿", false), _flag("🇪🇬", false), _flag("🇹🇳", false),
            ]),
          ),
          SizedBox(height: 10),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 8, mainAxisSpacing: 8),
              itemCount: rooms.length,
              itemBuilder: (c, i) => Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), image: DecorationImage(image: NetworkImage(rooms[i]["img"]!), fit: BoxFit.cover)),
                child: Stack(children: [
                  Positioned(top: 6, left: 6, child: Container(padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.black54, borderRadius: BorderRadius.circular(10)), child: Text("1", style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold)))),
                  Positioned(bottom: 0, left: 0, right: 0, child: Container(padding: EdgeInsets.all(6), decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.transparent, Colors.black87]), borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Row(children: [Icon(Icons.volume_up, size: 12, color: Colors.white), SizedBox(width: 4), Text(rooms[i]["users"]!, style: TextStyle(color: Colors.white, fontSize: 11))]),
                    SizedBox(height: 2),
                    Text(rooms[i]["title"]!, style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold), maxLines: 1),
                  ]))),
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
  Widget _flag(String e, bool sel) => Container(margin: EdgeInsets.symmetric(horizontal: 4), padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: sel ? Color(0xFF7C4DFF) : Colors.white12, borderRadius: BorderRadius.circular(20)), child: Text(e, style: TextStyle(fontSize: 18)));
}

// صفحة البروفايل
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF4A148C), Color(0xFF1A0A33), Color(0xFF0D041E)])),
      child: SafeArea(
        child: Column(children: [
          SizedBox(height: 10),
          Align(alignment: Alignment.topLeft, child: Padding(padding: EdgeInsets.only(left: 16), child: Icon(Icons.edit, color: Colors.white70))),
          CircleAvatar(radius: 38, backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=15")),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text("موكشه 🇾🇪", style: TextStyle(color: Color(0xFFB388FF), fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(width: 6),
            Icon(Icons.male, color: Colors.blueAccent, size: 18),
            Icon(Icons.flag, color: Colors.white, size: 16),
          ]),
          SizedBox(height: 4),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Icon(Icons.copy, color: Colors.white38, size: 14),
            SizedBox(width: 4),
            Text("ID:7495971", style: TextStyle(color: Colors.white70, fontSize: 13)),
          ]),
          SizedBox(height: 16),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            _stat("1165", "الزائرون"), _stat("62", "المعجبون"), _stat("35", "يتابعون"), _stat("26", "الأصدقاء"),
          ]),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            height: 90,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: LinearGradient(colors: [Color(0xFF2C1810), Color(0xFF8D6E3A)]), image: DecorationImage(image: NetworkImage("https://i.imgur.com/8Km9tLL.png"), fit: BoxFit.cover, opacity: 0.5)),
            child: Stack(children: [
              Positioned(left: 16, top: 20, child: Text("SVIP Club", style: TextStyle(color: Colors.amber, fontSize: 28, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic))),
              Positioned(left: 16, bottom: 12, child: Text("فتح المزيد من الامتيازات >>", style: TextStyle(color: Colors.amber.shade100, fontSize: 12))),
            ]),
          ),
          SizedBox(height: 12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(children: [
              Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12), decoration: BoxDecoration(color: Color(0xFF3A1A6B), borderRadius: BorderRadius.circular(12), border: Border.all(color: Color(0xFFB388FF).withOpacity(0.5))), child: Row(children: [Text("Lv8", style: TextStyle(color: Colors.white70)), Spacer(), Text("Level", style: TextStyle(color: Color(0xFFB388FF), fontWeight: FontWeight.bold, fontSize: 20))]))),
              SizedBox(width: 10),
              Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 14, horizontal: 12), decoration: BoxDecoration(color: Color(0xFF4A3A0A), borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.amber.withOpacity(0.5))), child: Row(children: [Icon(Icons.shield, color: Colors.amber), Spacer(), Text("VIP", style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 20))]))),
            ]),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ListView(
              children: [
                _menu("المحفظة", Icons.account_balance_wallet_outlined),
                _menu("غرفتي", Icons.home_outlined),
                _menu("الوكالة", Icons.shield_outlined),
                _menu("متجر", Icons.shopping_bag_outlined),
                _menu("الإعدادات", Icons.settings_outlined),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _stat(String num, String label) => Column(children: [Text(num, style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)), SizedBox(height: 2), Text(label, style: TextStyle(color: Colors.white54, fontSize: 12))]);
  Widget _menu(String title, IconData icon) => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    child: Row(children: [
      Icon(Icons.chevron_left, color: Colors.white24),
      Spacer(),
      Text(title, style: TextStyle(color: Colors.white, fontSize: 15)),
      SizedBox(width: 12),
      Icon(icon, color: Colors.white70),
    ]),
  );
}
