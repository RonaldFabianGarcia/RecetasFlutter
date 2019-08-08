import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipes/auth/auth.dart';
import 'package:recipes/login_admin/contentPage.dart';
import 'package:recipes/widgets/home_page.dart';

const PrimaryColor = const Color(0xFF192128);

class HomePage extends StatefulWidget {
  final BaseAuth auth;
  final VoidCallback onSignedOut;
  HomePage({this.auth,this.onSignedOut});
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String usuario ="Usuario";
  String usuarioEmail = 'Email';
  String id;

  Content page = ContentPage();

  Widget contentPage = HomePageRecipes();//Pagina principal de recetas

  void _signOut()async{
    try {
      widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    widget.auth.infoUser().then((onValue) {
      setState(() {
        usuario = onValue.displayName;
        usuarioEmail = onValue.email;
        id=onValue.uid;
        print('ID $id');
      });
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      drawer: Drawer(        
          elevation: 30.0,
          child: Container(
            color: Color(0xFF19212B),      
            child: ListView(
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    maxRadius: 10.0,
                    backgroundImage: AssetImage('assets/images/cocina.jpg'),
                    //backgroundImage: NetworkImage('https://abc'),
                  ),
                  accountName: Text(
                    '$usuario',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  accountEmail: Text('$usuarioEmail',
                      style: TextStyle(color: Colors.white)),
                  decoration: BoxDecoration(
                      color: Color(0xFF262F3D),
                      image: DecorationImage(
                        alignment: Alignment(1.0, 0),
                        image: AssetImage(
                          'assets/images/misanplas.jpg', 
                        ),
                        fit: BoxFit.scaleDown, //BoxFit.fitHeight
                      )),
                ),
                
                 ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                     page.lista().then((value) {
                      print(value);
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  leading: Icon(Icons.home, color: Color(0xFF4FC3F7),),
                  title: Text('Home', style: TextStyle(color: Colors.white),),
                ),
                Divider(height: 2.0, color: Colors.white,),
                 ListTile(
                  onTap: () {
                    // Navigator.of(context).pop();
                    //  page.myrecipe().then((value) {
                    //   print(value);
                    //   setState(() {
                    //     contentPage = value;
                    //   });
                    // });
                  },
                  leading: Icon(FontAwesomeIcons.pizzaSlice, color: Color(0xFF4FC3F7),),
                  title: Text('My Recipe', style: TextStyle(color: Color(0xFF4FC3F7)),),
                ),   
                ListTile(
                  onTap: () {
                    Navigator.of(context).pop();
                     page.admin().then((value) {
                      print(value);
                      setState(() {
                        contentPage = value;
                      });
                    });
                  },
                  leading: Icon(Icons.contact_mail, color: Color(0xFF4FC3F7),),
                  title: Text('Admin', style: TextStyle(color: Color(0xFF4FC3F7)),),
                ),               
                ListTile(
                  onTap: () {
                    // Navigator.of(context).pop();
                    //  page.mapa().then((value) {
                    //   print(value);
                    //   setState(() {
                    //     contentPage = value;
                    //   });
                    // });
                  },
                  leading: Icon(FontAwesomeIcons.map, color: Color(0xFF4FC3F7),),
                  title: Text('Mapa Tiendas', style: TextStyle(color: Color(0xFF4FC3F7)),),
                ),             
                ListTile(
                  title: Text('Salir', style: TextStyle(color: Color(0xFF4FC3F7)),),
                  leading: Icon(Icons.exit_to_app, color: Color(0xFF4FC3F7),),        
                  onTap: () {
                    Navigator.of(context).pop();
                    _signOut();
                  },
                ),
              ],
            ),
          )),
     appBar: AppBar(
       backgroundColor: PrimaryColor,
        title: Text('Recetas'),        
         actions: <Widget>[
          IconButton(
            icon: Icon(Icons.grid_on),
            tooltip: 'Grid',
            onPressed: () { 
            //   Route route = MaterialPageRoute(builder: (context) => GridPageInicio());
            //  Navigator.push(context, route);            
            },
          ),
        ],
      ), 
      body: contentPage,
    );
  }
}