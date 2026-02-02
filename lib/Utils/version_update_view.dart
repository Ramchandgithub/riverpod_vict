import 'package:flutter/material.dart';
import 'package:store_redirect/store_redirect.dart';

import '../../utils/constants.dart';
import '../../utils/local_package_info.dart';
import 'package:get/get.dart';



class VersionUpdateView extends StatelessWidget {
  static const String routeName = '/VersionUpdateView';
  const VersionUpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Version Update',style: TextStyle(color: Colors.white),),
        leading: IconButton(
          icon: Icon(
              Icons.arrow_back
          ),
          onPressed: (){
           // Get.offAllNamed(LoginView.routeName);
            // Navigator.pop(context);
          },
        ),

      ),
      body: WillPopScope(
        onWillPop: ()=> onBackPress(),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 270,
                  width: 300,
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.rectangle,
                  ),
                  child: Image.asset(
                    "${Constants.ImagePath}update.png",
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Time To Update!',
                  style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: const Text(
                    ' We added some new features and fix ',
                    style: TextStyle(color: Colors.black,fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: const Text(
                    'some bugs to make your experience as',
                    style: TextStyle(color: Colors.black,fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    'smooth as possible.',
                    style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Theme.of(context).primaryColor),
                  width: 250,
                  height: 50,
                  child: TextButton(
                    onPressed: () {
                      StoreRedirect.redirect(
                          androidAppId: LocalPackageInfo.getPackageName());
                    },
                    child: const Text(
                      'Click Here to Update',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  onBackPress() {
    //Get.offAllNamed(LoginView.routeName);
  }
}
