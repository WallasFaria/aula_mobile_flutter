import 'package:flutter/cupertino.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('SignUp')),
      child: Center(child: Text('SignUp')),
    );
  }
}
