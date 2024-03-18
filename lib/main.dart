import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// 導入所需的Flutter套件和自定義的頁面
import 'main_page.dart';
import './slam_dunk_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AboutPage()); // 設定AboutPage為首頁
  }
}

// 使用StatefulWidget來管理有狀態的widget，例如在不同頁面之間切換
class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends State<AboutPage> {
  int _currentIndex = 0; // 用來追蹤目前選擇的頁面索引

  // 定義一個widget列表，這裡放置了應用中所有的頁面
  final List<Widget> _children = [
    const MainPage(), // 首頁widget
    const SlamDunkPage(), // 資訊頁面widget
  ];

  // 處理底部導航欄項目的點擊事件
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index; // 更新目前選擇的索引值
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(209, 243, 162, 162), // 設置背景顏色
        body: _children[_currentIndex], // 根據目前的索引值顯示對應的頁面
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color.fromARGB(240, 247, 233, 233), // 導航欄的背景顏色
          selectedItemColor: const Color.fromARGB(181, 243, 44, 37), // 選中項目的顏色
          unselectedItemColor:
              const Color.fromARGB(255, 49, 37, 37), // 未選中項目的顏色
          onTap: onTabTapped, // 設置點擊事件的處理函數
          currentIndex: _currentIndex, // 目前選擇的索引值
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home), // 首頁圖標
              label: '首頁', // 標籤
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info), // 資訊頁面圖標
              label: '資訊', // 標籤
            ),
          ],
        ),
      ),
    );
  }
}
