import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold( //天地中央 refs: https://qiita.com/sekitaka_1214/items/03255fd9f61685503af3
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // いろんなかたちのボタン refs: https://zenn.dev/coka01/articles/cb0b632766138e9858e7
            RaisedButton(
              child: const Text('Sign in with Facebook', style: TextStyle(color: Colors.white),),
              color: Color(0xFF3B5998),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: () {},
            ),

            // google のロゴ付きボタン refs: https://medium.com/flutter-community/flutter-implementing-google-sign-in-71888bca24ed
            RaisedButton(
              color: Colors.white,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(image: AssetImage("assets/google_logo.png"), height: 16.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'Sign in with Google',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}