import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:iconsax_preview/iconsax_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final minCount = 4;

  final iconSaxData = IconSaxData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView.builder(
        itemCount: iconSaxData.icons.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 140,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async {
              await Clipboard.setData(ClipboardData(text: iconSaxData.icons_name[index]));
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0x1aFF5F8F), borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(iconSaxData.icons[index], size: 30 ,),
                    const SizedBox(height: 10,),
                    Text(iconSaxData.icons_name[index].replaceAll("Iconsax.", ""))
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
