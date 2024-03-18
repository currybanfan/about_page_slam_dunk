// 引入Flutter庫
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'infos.dart'; // 長文本常數

// 定義SlamDunkPage頁面的StatelessWidget
class SlamDunkPage extends StatelessWidget {
  // 構造函數，接收可選的Key
  const SlamDunkPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用Column布局顯示頁面內容
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // 主軸對齊方式為中心對齊
      children: <Widget>[
        const SizedBox(height: 20), // 添加上方間距
        const Text(
          '灌籃高手', // 文本內容
          style: TextStyle(
            color: Colors.black87, // 文字顏色
            fontSize: 36, // 文字大小
            fontWeight: FontWeight.bold, // 字體粗細：加粗
            letterSpacing: 4.0, // 字間距
            decorationStyle: TextDecorationStyle.dashed, // 裝飾線樣式
          ),
        ),
        const SizedBox(height: 8), // 文本下方間距
        buildDecorationImage(context), // 調用buildDecorationImage方法顯示裝飾圖片
        const SizedBox(height: 20), // 圖片下方間距
        Container(
          height: 300, // 容器高度
          margin: const EdgeInsets.symmetric(horizontal: 20), // 左右邊距
          child: const SingleChildScrollView(
            child: Text(
              sdInfo, // 顯示灌籃高手相關信息，這個變量應該是在infos.dart中定義
              style: TextStyle(
                color: Colors.black87, // 文字顏色
                fontSize: 16, // 文字大小
                fontWeight: FontWeight.bold, // 字體粗細：加粗
                letterSpacing: 2.0, // 字間距
              ),
            ),
          ),
        ),
        const SizedBox(height: 20), // 底部間距
      ],
    );
  }

  // 方法：構建並返回裝飾圖片的Widget
  Widget buildDecorationImage(BuildContext context) {
    // 使用Center使容器居中
    return Center(
      child: Container(
        width: 400, // 容器寬度
        height: 250, // 容器高度
        margin: const EdgeInsets.all(5), // 全邊距
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), // 容器圓角
          color: Colors.green, // 容器背景顏色
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20), // 圖片圓角
          child: SizedBox.fromSize(
            size: const Size.fromRadius(48), // 圖片尺寸
            child: Image.asset('assets/images/all.jpg',
                fit: BoxFit.cover), // 載入並顯示圖片
          ),
        ),
      ),
    );
  }
}
