import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:victous/Controllers/auth_controller.dart';
import 'package:victous/State/auth_state.dart';
import 'package:victous/Utils/session_manager.dart';

import '../Presentation/main_view.dart';
import '../Utils/constants.dart';
import '../Utils/drawer_data.dart';
import '../Utils/drawer_enum.dart';
import '../Utils/logger.dart';

class MainDrawer extends ConsumerStatefulWidget {
  const MainDrawer({super.key, required AdvancedDrawerController advCtrl});

  @override
  ConsumerState<MainDrawer> createState() => _MainDrawerConsumerState();
}

class _MainDrawerConsumerState extends ConsumerState<MainDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    ref.listen<AuthState>(authProvider, (prev, next) {
      if (prev?.isLoggedIn == true && next.isLoggedIn == false) {
        Get.offAllNamed(Main.routeName);
      }
    });
    
   
    return Drawer(
      backgroundColor: Theme.of(context).primaryColor,
      child: ListView(
        children:  authState.isLoggedIn
        ? _buildLoggedInDrawer(context, ref)
        : _buildLoggedOutDrawer(context, ref,)

      ),
    );
  }



  List<Widget> _buildLoggedInDrawer(BuildContext context, WidgetRef ref) {
    return [
      Column(
        children: [
          Container(
            width: 80.0,
            height: 80.0,
            margin: EdgeInsets.only(
                top:20.0,
                bottom:10.0
            ),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color:Colors.white,
              shape:BoxShape.circle,
            ),
            child: CachedNetworkImage(
              imageUrl:"${SessionManager.getString(Constants.profile_pic)}",
              height: 50,
              width: 50,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => Image.asset(
                '${Constants.ImagePath}logo.png',
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),

          ),
          const SizedBox(width: 5,),
          Container(
            margin: const EdgeInsets.only(
              top: 20.0,
              bottom: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("    User ID : ", style: const TextStyle(color: Colors.white
                    )),
                    Text("${SessionManager.getString(Constants.PREF_UserId)}",
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("    Name : ", style: const TextStyle(color: Colors.white

                    )),
                    Flexible(
                      child: Container(
                          padding: const EdgeInsets.only(left: 3),
                          child: Text(
                            SessionManager.getString(Constants.PREF_UserName),
                            //maxLines: 2,
                            style: const TextStyle(
                               color: Colors.white,
                              overflow: TextOverflow.clip,
                              fontSize: 12,
                            ),
                          )
                      ),
                    ),
                  ],
                ),

              ],
            ),
          ),

        ],
      ),
      for (final section in loggedInDrawer)
        section.children.isEmpty
            ? _drawerTile(context, ref, section.header)
            : _drawerExpansion(context, ref, section),
    ];
  }

  List<Widget> _buildLoggedOutDrawer(BuildContext context, WidgetRef ref){
    return[
      Container(
        width: 80.0,
        height: 80.0,
        margin: EdgeInsets.only(
            top:20.0,
            bottom:10.0
        ),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color:Colors.white,
          shape:BoxShape.circle,
        ),
        child: CachedNetworkImage(
          imageUrl:"${SessionManager.getString(Constants.profile_pic)}",
          height: 50,
          width: 50,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: 50,
              width: 50,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          errorWidget: (context, url, error) => Image.asset(
            '${Constants.ImagePath}logo.png',
            width: 40,
            height: 40,
            fit: BoxFit.contain,
          ),
        ),

      ),
      const SizedBox(width: 5,),
      for (final item in loggedOutDrawer)
        _drawerTile(context, ref, item )
    ];
  }


  Widget _drawerExpansion(BuildContext context, WidgetRef ref, DrawerSection section) {
    return ExpansionTile(
      trailing: Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white,),
      title: Text(section.title, style: const TextStyle(color: Colors.white)),
      children: [
        for (final item in section.children) _drawerTile(context, ref, item)
      ],
    );
  }


  Widget _drawerTile(BuildContext context, WidgetRef ref, DrawerItem item) {
    return Card(
      color: Theme.of(context).primaryColor,
      elevation: 2,
      child: ListTile(
        leading: item.asset != null
            ? Image.asset(item.asset!, height: 20, color: Colors.white)
            : Icon(item.icon, color: Colors.white),
        title: Text(item.title, style: const TextStyle(color: Colors.white)),
        onTap: () {
          Logger.logger("item.menu:::${item.menu}");
          Logger.logger(" ref.read(drawerMenuProvider.notifier).state:::${ ref.read(drawerMenuProvider.notifier).state}");
          ref.read(drawerMenuProvider.notifier).state = item.menu;
        },
      ),
    );

  }

}


class DrawerItem {
  final DrawerMenu menu;
  final String title;
  final IconData? icon;
  final String? asset;

  DrawerItem({
    required this.menu,
    required this.title,
    this.icon,
    this.asset,
  });
}

class DrawerSection {
  final String title;
  final DrawerItem header;
  final List<DrawerItem> children;

  DrawerSection({
    required this.title,
    required this.header,
    this.children = const [],
  });
}
