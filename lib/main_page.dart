// 引入Flutter框架和自定義的信息文件。
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'infos.dart';

// 主頁面StatelessWidget，展示應用主界面。
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 使用SingleChildScrollView以支持內容滾動。
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 30), // 上方間距
          buildDecorationImage(context), // 主題圖片
          const SizedBox(height: 15), // 間距
          Center(
            child: buildStyleText(context, '角色介紹'), // 樣式化文字
          ),
          const SizedBox(height: 15), // 間距
          buildCharactersPageView(context), // 角色介紹的滑動頁面視圖
          const SizedBox(height: 15), // 間距
          Center(
            child: buildStyleText(context, '電影版'), // 樣式化文字
          ),
          const SizedBox(height: 15), // 間距
          buildMoviesPageView(context), // 電影版介紹的滑動頁面視圖
          const SizedBox(height: 15), // 底部間距
        ],
      ),
    );
  }

  Widget buildStyleText(BuildContext context, String text) {
    return Text(
      text,
      style: const TextStyle(
        // 文字顏色
        color: Colors.black87,
        // 文字大小
        fontSize: 24,
        // 字體粗細：加粗
        fontWeight: FontWeight.bold,
        // 字間距
        letterSpacing: 2.0,
        // 文字陰影
        shadows: [
          Shadow(
            blurRadius: 10.0,
            color: Colors.black38,
            offset: Offset(5.0, 5.0),
          ),
        ],
        decorationStyle: TextDecorationStyle.dashed, // 裝飾線樣式
      ),
    );
  }

  // 構建裝飾圖片的Widget。
  Widget buildDecorationImage(BuildContext context) {
    return Center(
      // 使用Center Widget使得內部的Container在其父Widget中居中。
      child: Container(
        width: 400, // 容器的寬度設置為400像素。
        height: 250, // 容器的高度設置為250像素。
        margin: const EdgeInsets.all(5), // 為容器添加全邊距，每邊5像素。
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), // 為容器添加圓角，半徑為50像素。
          color: Colors.green, // 容器的背景顏色設置為綠色。
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20), // 設置圖片圓角，半徑為20像素。
          child: SizedBox.fromSize(
            size: const Size.fromRadius(48), // 設置圖片的尺寸，以半徑48像素的圓形尺寸來定義。
            child: Image.asset('assets/images/main.png', fit: BoxFit.cover),
            // 從資源加載圖片，並使圖片填充整個容器（裁剪並保持圖片比例）。
          ),
        ),
      ),
    );
  }

  // 構建角色介紹的滑動頁面視圖。
  Widget buildCharactersPageView(BuildContext context) {
    // 定義角色資訊，包括名字、圖片和詳細信息。
    List<Map<String, String>> characters = [
      {
        'name': '赤木剛憲',
        'url': 'assets/images/4.png',
        'ava_url': 'assets/images/4_ava.png',
        'info': info4
      },
      {
        'name': '櫻木花道',
        'url': 'assets/images/10.png',
        'ava_url': 'assets/images/10_ava.png',
        'info': info10
      },
      {
        'name': '三井壽',
        'url': 'assets/images/14.png',
        'ava_url': 'assets/images/14_ava.png',
        'info': info14
      },
      {
        'name': '流川楓',
        'url': 'assets/images/11.png',
        'ava_url': 'assets/images/11_ava.png',
        'info': info11
      },
      {
        'name': '宮城良田',
        'url': 'assets/images/7.png',
        'ava_url': 'assets/images/7_ava.png',
        'info': info7
      },
    ];

    // 使用PageController來控制PageView的行為。這裡設定每個頁面佔據視窗的70%，可以同時顯示3張圖片在畫面中。
    PageController pageController = PageController(
      viewportFraction: 0.7,
      initialPage: 2, // 初始顯示第三個角色。
    );

    // 返回一個SizedBox，其中包含一個PageView.builder。
    // PageView.builder動態創建每個角色的顯示頁面。
    return SizedBox(
      height: 400, // 高度設為400像素。
      child: PageView.builder(
        controller: pageController, // 使用上面創建的pageController。
        itemCount: characters.length, // 頁面數量等於角色列表的長度。
        itemBuilder: (BuildContext context, int index) {
          // 對於列表中的每個角色，調用`buildCharacterItem`來構建其展示Widget。
          return buildCharacterItem(context, characters[index]);
        },
      ),
    );
  }

  Widget buildCharacterItem(
      BuildContext context, Map<String, String> character) {
    // 這是一個手勢偵測Widget，用於處理點擊事件。
    return GestureDetector(
      onTap: () {
        // 點擊後的動作：導航到詳細頁面，並傳遞角色名字、頭像URL和詳細信息。
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              name: character['name']!, // 角色名字。
              url: character['ava_url']!, // 頭像URL。
              info: character['info']!, // 角色相關信息。
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10), // 外邊距。
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), // 圓角邊框。
          color: Colors.red, // 背景顏色。
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20), // 圖片的圓角邊框。
          child: SizedBox.fromSize(
            size: const Size.fromRadius(48), // 圖片的尺寸。
            child:
                Image.asset(character['url']!, fit: BoxFit.cover), // 加載並顯示角色圖片。
          ),
        ),
      ),
    );
  }

  // 建立電影版頁面的PageView，用於展示電影相關的資訊。
  Widget buildMoviesPageView(BuildContext context) {
    // 定義一個包含電影資訊的列表，這裡只有一部電影作為示例。
    List<Map<String, String>> movies = [
      {
        'name': 'THE FIRST SLAM DUNK', // 電影名稱
        'url': 'assets/images/movie.jpg', // 電影海報圖片的路徑
        'ava_url': 'assets/images/movie_ava.png', // 電影縮略圖或頭像的路徑
        'info': infoMovie // 電影的詳細資訊，假定這是一個預先定義的字符串變量
      },
    ];

    // 創建一個PageController來控制PageView的行為，設定每個頁面視圖佔據70%的視口。
    PageController pageController = PageController(
      viewportFraction: 0.7,
      initialPage: 0, // 初始顯示的頁面索引
    );

    // 返回一個固定高度的SizedBox，內部包含一個PageView.builder。
    return SizedBox(
      height: 400, // 高度設定為400像素
      child: PageView.builder(
        controller: pageController, // 使用上述定義的pageController
        itemCount: movies.length, // 頁面數量，即movies列表的長度
        itemBuilder: (BuildContext context, int index) {
          // 根據index來建構每個頁面，這裡調用下面定義的buildMovieItem方法
          return buildMovieItem(context, movies[index]);
        },
      ),
    );
  }

  // 建立單個電影項目的Widget，包括圖片和點擊事件處理。
  Widget buildMovieItem(BuildContext context, Map<String, String> movie) {
    // 使用GestureDetector來偵測用戶的點擊事件。
    return GestureDetector(
      onTap: () {
        // 點擊後執行的動作：導航到詳細頁面，並傳遞電影的名稱、縮略圖路徑和詳細資訊。
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(
              name: movie['name']!, // 電影名稱
              url: movie['ava_url']!, // 電影縮略圖或頭像的路徑
              info: movie['info']!, // 電影的詳細資訊
            ),
          ),
        );
      },
      // 電影項目的外觀設定，包括邊框、圓角和背景色。
      child: Container(
        margin: const EdgeInsets.all(10), // 外邊距
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), // 圓角邊框
          color: Colors.green, // 容器背景色
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20), // 圖片圓角邊框
          child: SizedBox.fromSize(
            size: const Size.fromRadius(48), // 圖片的尺寸
            child: Image.asset(movie['url']!, fit: BoxFit.cover), // 加載並顯示電影海報圖片
          ),
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  // 這些final變量用於存儲從其他頁面傳遞過來的參數。
  final String name; // 角色或項目的名字。
  final String url; // 圖像的資源URL。
  final String info; // 詳細信息的文本。

  // 構造函數，要求初始化時提供名字、圖像URL和詳細信息。
  const DetailPage({
    super.key,
    required this.name,
    required this.url,
    required this.info,
  });

  @override
  Widget build(BuildContext context) {
    // Scaffold提供了基本的應用頁面框架。
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black26, // 應用欄背景顏色。
        title: Text(name), // 顯示傳入的名字作為頁面標題。
      ),
      backgroundColor: const Color.fromARGB(255, 253, 195, 191), // 設定頁面背景顏色。
      body: Column(
        // 使用Column布局依次排列子widget。
        children: [
          const SizedBox(
            height: 10, // 頂部間隙。
          ),
          Align(
            // Align用於將其子widget對齊。
            alignment: Alignment.topCenter, // 置於頂部中央。
            child: ClipOval(
              // ClipOval用於將子widget裁剪成圓形。
              child: SizedBox.fromSize(
                size: const Size.fromRadius(60), // 設定圓形的半徑。
                child:
                    Image.asset(url, fit: BoxFit.cover), // 加載並顯示圖像，適配覆蓋整個圓形區域。
              ),
            ),
          ),
          const SizedBox(
            height: 30, // 圖像與文本之間的間隙。
          ),
          Container(
            height: 500, // 文本容器的高度。
            margin: const EdgeInsets.symmetric(horizontal: 15), // 容器的左右邊距。
            child: SingleChildScrollView(
              // SingleChildScrollView使內部內容可滾動。
              child: Text(
                info, // 顯示傳入的詳細信息文本。
                style: const TextStyle(
                  color: Colors.black, // 文本顏色。
                  fontSize: 14, // 文本大小。
                  letterSpacing: 2.0, // 字母間距。
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
