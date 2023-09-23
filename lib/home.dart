
import 'package:herb_nook/components/botton_nav_bar.dart';
import 'package:herb_nook/pages/cart_page.dart';
import 'package:herb_nook/pages/setting_page.dart';
import 'package:herb_nook/pages/shop_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  void navigateBottomBar(int newIndex){
    setState(() {
      _selectedIndex = newIndex;
    });
  }
  final List<Widget> _pages = [
    ShopPage(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.green.shade700),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:Text('HERBNOOK',
        style: TextStyle(
          fontSize: 22,
          letterSpacing: 3,
          fontWeight: FontWeight.bold,
          color: Colors.green.shade700
        ),),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.green[200],
          child: ListView(
            children: [
              DrawerHeader(child: Image.asset('assets/images/mint.png',height: 50,width: 50,),
              ),
              ListTile(
                leading: Icon(Icons.home,size: 35,color: Colors.green.shade600,),
                title: Text('H O M E'),
                onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Home()))
              ),
              const SizedBox(height: 12,),
              ListTile(
                  leading: Icon(Icons.settings,size: 35,color: Colors.green.shade600,),
                  title: Text('S E T T I N G'),
                  onTap: ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SettingPage()))
              ),
              const SizedBox(height: 12,),

              ListTile(
                  leading: Icon(Icons.logout,size: 35,color: Colors.green.shade600,),
                  title: Text('L O G O U T'),
                  onTap: ()=> FirebaseAuth.instance.signOut()
              ),
              const SizedBox(height: 12,),
            ],
          ),
        ),

      ),
      backgroundColor: Colors.green.shade200,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
