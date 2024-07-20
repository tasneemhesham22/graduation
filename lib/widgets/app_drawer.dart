// import 'package:flutter/material.dart';
// import 'package:graduation/utils/shared_prefs.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AppDrawer extends StatelessWidget {
//   final String? firstName;
//   final String? lastName;
//   final String? phoneNumber;
//   final VoidCallback onLogout;

//   AppDrawer({
//     this.firstName,
//     this.lastName,
//     this.phoneNumber,
//     required this.onLogout,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           UserAccountsDrawerHeader(
//             accountName: Text(
//               firstName != null && lastName != null
//                   ? '$firstName $lastName'
//                   : phoneNumber ?? '',
//             ),
//             accountEmail: null,
//             currentAccountPicture: CircleAvatar(
//               child: Icon(Icons.person),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.logout),
//             title: Text('Log Out'),
//             onTap: () async {
//               SharedPrefs prefs = await SharedPrefs.getInstance();
//               await prefs.setBool('isLoggedIn', false);
//               onLogout();
//               Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String? firstName;
  final String? lastName;
  final String? phoneNumber;
  final VoidCallback onLogout;

  AppDrawer({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('$firstName $lastName'),
            accountEmail: Text(phoneNumber ?? ''),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              onLogout();
            },
          ),
        ],
      ),
    );
  }
}
