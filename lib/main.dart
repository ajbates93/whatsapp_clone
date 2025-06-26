import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

part 'main.g.dart';

// Mobx Store for Theme Management
class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  @observable
  ThemeMode themeMode = ThemeMode.system;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  @action
  void toggleTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
  }

  @action
  void setTheme(ThemeMode mode) {
    themeMode = mode;
  }

  @computed
  String get themeName {
    switch (themeMode) {
      case ThemeMode.light:
        return 'Light';
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.system:
        return 'System';
    }
  }
}

final themeStore = ThemeStore();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        title: "WhatsApp Clone",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF25D366),
            brightness: Brightness.light,
          ),
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF25D366),
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFF0B141B),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF202C33),
            foregroundColor: Colors.white,
          ),
        ),
        // MobX observable controls the theme
        themeMode: themeStore.themeMode,
        home: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Example of local StatefulWidget state alongside MobX
  int _messageCount = 0;

  void _incrementMessages() {
    setState(() {
      _messageCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        actions: [
          Observer(
            builder: (_) => IconButton(
              icon: Icon(
                themeStore.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              ),
              onPressed: () => themeStore.toggleTheme(),
            ),
          ),
        ],
      ),
    );
  }
}

// class LayoutPractice extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Layout Practice'),
//         backgroundColor: Colors.blue,
//       ),
//       body: Column(
//         children: [
//           // Header section
//           Container(
//             width: double.infinity,
//             padding: EdgeInsets.all(20),
//             color: Colors.grey[200],
//             child: Text(
//               'Welcome to Flutter',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               textAlign: TextAlign.center,
//             ),
//           ),

//           // Card-like section
//           Container(
//             margin: EdgeInsets.all(16),
//             padding: EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(8),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   spreadRadius: 1,
//                   blurRadius: 3,
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Card Title',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue,
//                     letterSpacing: 1.2,
//                     decoration: TextDecoration.underline,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text('This is some content inside a card-like container.'),
//               ],
//             ),
//           ),

//           // Button row
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     child: Text('Button 1'),
//                   ),
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () {},
//                     child: Text('Button 2'),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ProfileScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         actions: [IconButton(icon: Icon(Icons.edit), onPressed: () {})],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Profile Header
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(24),
//               color: Theme.of(context).primaryColor.withOpacity(0.1),
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundColor: Theme.of(context).primaryColor,
//                     child: Icon(Icons.person, size: 50, color: Colors.white),
//                   ),
//                   SizedBox(height: 16),
//                   Text(
//                     'Alex Bates',
//                     style: Theme.of(context).textTheme.headlineLarge,
//                   ),
//                   Text(
//                     'Software Engineer',
//                     style: TextStyle(fontSize: 16, color: Colors.grey[600]),
//                   ),
//                 ],
//               ),
//             ),

//             // Stats Row
//             Padding(
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 children: [
//                   Expanded(child: _buildStatCard('Projects', '12')),
//                   SizedBox(width: 8),
//                   Expanded(child: _buildStatCard('Experience', '10 years')),
//                   SizedBox(width: 8),
//                   Expanded(child: _buildStatCard('Rating', '4.8')),
//                 ],
//               ),
//             ),

//             // Menu Items
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Column(
//                 children: [
//                   _buildMenuItem(Icons.work, 'Work Experience', 'View details'),
//                   _buildMenuItem(Icons.school, 'Education', 'Qualifications'),
//                   _buildMenuItem(Icons.code, 'Skills', 'Technical skills'),
//                   _buildMenuItem(Icons.contact_mail, 'Contact', 'Get in touch'),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStatCard(String label, String value) {
//     return Card(
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           children: [
//             Text(
//               value,
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 4),
//             Text(
//               label,
//               style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildMenuItem(IconData icon, String title, String subtitle) {
//     return Card(
//       margin: EdgeInsets.only(bottom: 8),
//       child: ListTile(
//         leading: Icon(icon),
//         title: Text(title),
//         subtitle: Text(subtitle),
//         trailing: Icon(Icons.arrow_forward_ios, size: 16),
//         onTap: () {},
//       ),
//     );
//   }
// }
