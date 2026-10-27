import 'package:flutter/material.dart';

void main() {
  runApp(const MokshaApp());
}

class MokshaApp extends StatelessWidget {
  const MokshaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Moksha',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F0F1A),
        primaryColor: const Color(0xFF7C4DFF),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final rooms = [
    {"name": "قهوة الصباح ☕", "users": 12, "host": "أحمد"},
    {"name": "نقاش كتب 📚", "users": 5, "host": "سارة"},
    {"name": "مزيكا هادية 🎵", "users": 23, "host": "مصطفى"},
    {"name": "غرفة الضحك 😂", "users": 8, "host": "نور"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F1A),
        title: const Text('موكشا - غرف صوتية', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [IconButton(icon: const Icon(Icons.notifications), onPressed: () {})],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          return GestureDetector(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RoomScreen(roomName: room["name"] as String))),
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: const LinearGradient(colors: [Color(0xFF1E1E2F), Color(0xFF2A2A45)]),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFF7C4DFF).withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFF7C4DFF),
                    child: Text((room["host"] as String)[0], style: const TextStyle(fontSize: 24, color: Colors.white)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(room["name"] as String, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Text('المدير: ${room["host"]} • ${room["users"]} مستمع', style: const TextStyle(color: Colors.grey)),
                      ],
                    ),
                  ),
                  const Icon(Icons.mic, color: Color(0xFF7C4DFF)),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF7C4DFF),
        onPressed: () {},
        label: const Text('إنشاء غرفة جديدة'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class RoomScreen extends StatefulWidget {
  final String roomName;
  const RoomScreen({super.key, required this.roomName});
  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
  bool isMuted = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.roomName), backgroundColor: const Color(0xFF0F0F1A)),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(20),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, childAspectRatio: 0.8),
              itemCount: 6,
              itemBuilder: (context, i) => Column(
                children: [
                  Stack(children: [
                    const CircleAvatar(radius: 35, backgroundColor: Color(0xFF2A2A45), child: Icon(Icons.person, size: 40)),
                    if (i == 0) Positioned(bottom: 0, right: 0, child: Container(padding: const EdgeInsets.all(4), decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle), child: const Icon(Icons.mic, size: 12, color: Colors.white))),
                  ]),
                  const SizedBox(height: 8),
                  Text(i == 0 ? 'أنت (المدير)' : 'مستمع ${i}', style: const TextStyle(fontSize: 12)),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(color: Color(0xFF1E1E2F), borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.call_end, color: Colors.red, size: 30)),
                GestureDetector(
                  onTap: () => setState(() => isMuted = !isMuted),
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: isMuted ? Colors.red : const Color(0xFF7C4DFF), shape: BoxShape.circle),
                    child: Icon(isMuted ? Icons.mic_off : Icons.mic, color: Colors.white, size: 30),
                  ),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.hand_raised, color: Colors.orange, size: 30)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
