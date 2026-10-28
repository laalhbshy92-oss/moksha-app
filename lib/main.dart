import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MokshaApp());
}

class MokshaApp extends StatelessWidget {
  const MokshaApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: MainController());
  }
}

class MainController extends StatefulWidget {
  const MainController({super.key});
  @override
  State<MainController> createState() => _MainControllerState();
}

class _MainControllerState extends State<MainController> {
  int idx = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: idx == 0 ? const RoomsPage() : const ProfilePage(),
      bottomNavigationBar: Container(
        height: 70,
        decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF1E0E3A), Color(0xFF2A174F)])),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(onPressed: ()=>setState(()=>idx=1), icon: Icon(Icons.person, color: idx==1?Color(0xFFB388FF):Colors.white38)),
          IconButton(onPressed: ()=>setState(()=>idx=0), icon: Icon(Icons.home, color: idx==0?Color(0xFFB388FF):Colors.white38)),
        ]),
      ),
    );
  }
}

class RoomsPage extends StatelessWidget {
  const RoomsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF3B1F6E), Color(0xFF150A2E)])),
      child: SafeArea(child: Column(children: [
        const Padding(padding: EdgeInsets.all(16), child: Row(children: [Icon(Icons.search, color: Colors.white), Spacer(), Text("شائع  عالمي", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold))])),
        Expanded(child: GridView.builder(padding: const EdgeInsets.all(8), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.72, crossAxisSpacing: 8, mainAxisSpacing: 8), itemCount: 6, itemBuilder: (_, i) => ClipRRect(borderRadius: BorderRadius.circular(14), child: Stack(fit: StackFit.expand, children: [Image.network("https://picsum.photos/400/400?random=$i", fit: BoxFit.cover), Positioned(bottom: 0, left: 0, right: 0, child: Container(padding: const EdgeInsets.all(8), decoration: const BoxDecoration(gradient: LinearGradient(colors: [Colors.transparent, Colors.black87])), child: Text("روم ${i+1} - ID:7495971", style: const TextStyle(color: Colors.white, fontSize: 12))))])))),
      ])),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF5B2CB4), Color(0xFF2A1555), Color(0xFF10052A)])),
      child: SafeArea(child: Column(children: [
        const SizedBox(height: 10),
        const CircleAvatar(radius: 42, backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=15")),
        const SizedBox(height: 10),
        const Text("موكشه 🇾🇪", style: TextStyle(color: Color(0xFFB388FF), fontSize: 18, fontWeight: FontWeight.bold)),
        const Text("ID:7495971", style: TextStyle(color: Colors.white60)),
        const SizedBox(height: 12),
        const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [Column(children: [Text("1165", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)), Text("الزائرون", style: TextStyle(color: Colors.white54, fontSize: 11))]), Column(children: [Text("62", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)), Text("المعجبون", style: TextStyle(color: Colors.white54, fontSize: 11))]), Column(children: [Text("35", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)), Text("يتابعون", style: TextStyle(color: Colors.white54, fontSize: 11))]), Column(children: [Text("26", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)), Text("الأصدقاء", style: TextStyle(color: Colors.white54, fontSize: 11))])]),
        const SizedBox(height: 16),
        Container(margin: const EdgeInsets.symmetric(horizontal: 14), height: 80, decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), gradient: const LinearGradient(colors: [Color(0xFF3D2A1A), Color(0xFF8C6A3A)]), border: Border.all(color: Colors.amber)), child: const Padding(padding: EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text("SVIP Club", style: TextStyle(color: Color(0xFFFFD700), fontSize: 24, fontWeight: FontWeight.w900)), Text("فتح المزيد من الامتيازات >>", style: TextStyle(color: Colors.white70, fontSize: 11))]))),
        const SizedBox(height: 12),
        Container(padding: const EdgeInsets.all(8), margin: const EdgeInsets.symmetric(horizontal: 20), decoration: BoxDecoration(color: Colors.green.withOpacity(0.2), borderRadius: BorderRadius.circular(8)), child: const Row(mainAxisAlignment: MainAxisAlignment.center, children: [Icon(Icons.check_circle, color: Colors.greenAccent, size: 16), SizedBox(width: 6), Text("Firebase Connected: moksha-app-ce6e3", style: TextStyle(color: Colors.greenAccent, fontSize: 11))])),
      ])),
    );
  }
}
