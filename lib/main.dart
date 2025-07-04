import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> imagePaths = [
      'assets/images/11.jpg',
      'assets/images/12.jpg',
    ];

    final List<String> titles = ["ภาพที่ 1", "ภาพที่ 2"];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('รูปไรไม่รู้')),
        body: Column(
          children: [
            // 🔼 ListView ด้านบน
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: titles.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(titles[index]),
                    subtitle: const Text('รายละเอียด'),
                  );
                },
              ),
            ),

            // 🔽 GridView ด้านล่าง
            Expanded(
              flex: 1,
              child: GridView.count(
                crossAxisCount: 2, // 2 คอลัมน์
                padding: const EdgeInsets.all(8),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                children: imagePaths.map((path) {
                  return Image.asset(path, fit: BoxFit.cover);
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
