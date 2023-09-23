import 'package:herb_nook/components/square_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade200,
      appBar: AppBar(
        title: Text('S E T T I N G',style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w600,
        ),),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Account (${FirebaseAuth.instance.currentUser!.email})'),
                ),
              ),
              Divider(color: Colors.green.shade100,),
              const Padding(
                padding: EdgeInsets.only(bottom: 4),

                child: ListTile(
                  leading: Icon(Icons.shopping_cart),
                  title: Text('Orders'),
                ),
              ),
              Divider(color: Colors.green.shade100,),
              const Padding(
                padding: EdgeInsets.only(bottom: 4),

                child: ListTile(
                  leading: Icon(Icons.lock_open),
                  title: Text('Privacy & Security'),
                ),
              ),
              Divider(color: Colors.green.shade100,),


              const Padding(
                padding: EdgeInsets.only(bottom: 4),

                child: ListTile(
                  leading: Icon(Icons.headphones),
                  title: Text('Help'),
                ),
              ),
              Divider(color: Colors.green.shade100,),

              const Padding(
                padding: EdgeInsets.only(bottom: 4),

                child: ListTile(
                  leading: Icon(Icons.help),
                  title: Text('About'),
                ),
              ),
              Divider(color: Colors.green.shade100,),

            ],
          ),
        ),
      )
    );
  }
}
