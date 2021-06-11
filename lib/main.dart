import 'package:flutter/material.dart';

import 'injection_container.dart' as di;
import 'src/post/presentation/pages/post_page.dart';

void main() {
  di.init();
  runApp(MaterialApp(
      home: PostPage(),
      title: 'Henny App',
      theme: ThemeData(
          primarySwatch: Colors.orange, primaryColor: Color(0xFFFBBB3D))));
}
