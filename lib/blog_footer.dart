import 'package:flutter/material.dart';
import 'package:footer/footer.dart';

class BlogFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Footer(
      child: Column(
        children: [
          Text('© 1988-2020 Itluobo.com. All rights reserved. 鄂ICP备15009294号|https://beian.miit.gov.cn/#/Integrated/index')
        ],
      ),
    );
  }
}
