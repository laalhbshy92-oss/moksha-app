import 'package:flutter/material.dart';

void main() => runApp(MokshaApp());

class MokshaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF0A0A0A),
        primaryColor: Color(0xFFFF6B00),
      ),
      home: VoiceRoom(),
    );
  }
}

class VoiceRoom extends StatefulWidget {
  @override
  _VoiceRoomState createState() => _VoiceRoomState();
}

class _VoiceRoomState extends State<VoiceRoom> {
  bool isMuted = false;
  bool isDeaf = false;

  final memes = [
    {"emoji": "😱", "name": "ايه ده!"},
    {"emoji": "😂", "name": "احا"},
    {"emoji": "🔥", "name": "جامد فشخ"},
    {"emoji": "💀", "name": "عبث"},
    {"emoji": "👊", "name": "يلا يا زميلي"},
    {"emoji": "🤌", "name": "ايه يا عم"},
    {"emoji": "😭", "name": "هموت"},
    {"emoji": "🥶", "name": "سقعان"},
    {"emoji": "🤡", "name": "انت بتستهبل"},
    {"emoji": "🗣️", "name": "اسكت بقى"},
    {"emoji": "⚡", "name": "كهربا"},
    {"emoji": "🍳", "name": "بيض"},
  ];

  final users = [
    {"name": "انت", "speaking": true, "color": Colors.orange},
    {"name": "حماده", "speaking": false, "color": Colors.blue},
    {"name": "سيد", "speaking": true, "color": Colors.green},
    {"name": "ميدو", "speaking": false, "color": Colors.purple},
  ];

  void playMeme(String name) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("🔊 بيشغل: $name", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Color(0xFFFF6B00),
        duration: Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1A1A1A),
        title: Row(children: [
          CircleAvatar(backgroundColor: Color(0xFFFF6B00), child: Text("M", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
          SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("موكشا ميمز", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text("4 في الروم • دردشة صوتية", style: TextStyle(fontSize: 12, color: Colors.grey)),
          ])
        ]),
        actions: [Icon(Icons.more_vert)],
      ),
      body: Column(
        children: [
          // Voice users
          Container(
            padding: EdgeInsets.all(16),
            color: Color(0xFF1A1A1A),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: users.map((u) {
                return Column(children: [
                  Stack(children: [
                    CircleAvatar(radius: 32, backgroundColor: u["color"] as Color, child: Text((u["name"] as String)[0], style: TextStyle(fontSize: 24, color: Colors.white))),
                    if (u["speaking"] as bool)
                      Positioned(
                        bottom: 0, right: 0,
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle, border: Border.all(color: Color(0xFF1A1A1A), width: 2)),
                          child: Icon(Icons.mic, size: 12, color: Colors.white),
                        ),
                      ),
                  ]),
                  SizedBox(height: 8),
                  Text(u["name"] as String, style: TextStyle(fontSize: 12, fontWeight: u["speaking"] as bool ? FontWeight.bold : FontWeight.normal, color: u["speaking"] as bool ? Colors.white : Colors.grey)),
                ]);
              }).toList(),
            ),
          ),
          
          // Controls
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            color: Color(0xFF121212),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _controlBtn(Icons.mic_off, "ميوت", isMuted, () => setState(() => isMuted = !isMuted)),
                _controlBtn(Icons.headset_off, "صم", isDeaf, () => setState(() => isDeaf = !isDeaf)),
                _controlBtn(Icons.call_end, "خروج", false, () {}, isEnd: true),
              ],
            ),
          ),

          Divider(height: 1, color: Colors.grey.shade900),

          // Memes title
          Padding(
            padding: EdgeInsets.all(16),
            child: Row(children: [
              Icon(Icons.library_music, color: Color(0xFFFF6B00)),
              SizedBox(width: 8),
              Text("لوحة الميمز - دوس وشغل الصوت", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            ]),
          ),

          // Memes grid
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 12),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 1.1, crossAxisSpacing: 10, mainAxisSpacing: 10),
              itemCount: memes.length,
              itemBuilder: (c, i) {
                return InkWell(
                  onTap: () => playMeme(memes[i]["name"]!),
                  borderRadius: BorderRadius.circular(16),
                  child: Container(
                    decoration: BoxDecoration(color: Color(0xFF1E1E1E), borderRadius: BorderRadius.circular(16), border: Border.all(color: Color(0xFFFF6B00).withOpacity(0.3))),
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(memes[i]["emoji"]!, style: TextStyle(fontSize: 32)),
                      SizedBox(height: 6),
                      Text(memes[i]["name"]!, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13), textAlign: TextAlign.center),
                    ]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _controlBtn(IconData icon, String label, bool active, VoidCallback onTap, {bool isEnd = false}) {
    return Column(children: [
      InkWell(
        onTap: onTap,
        child: CircleAvatar(
          radius: 24,
          backgroundColor: isEnd ? Colors.red : active ? Color(0xFFFF6B00) : Color(0xFF2A2A2A),
          child: Icon(icon, color: Colors.white),
        ),
      ),
      SizedBox(height: 6),
      Text(label, style: TextStyle(fontSize: 11, color: active ? Color(0xFFFF6B00) : Colors.grey)),
    ]);
  }
}
