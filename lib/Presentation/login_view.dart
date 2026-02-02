


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:victous/Controllers/auth_controller.dart';
import 'package:victous/services/auth_service.dart';
import 'package:get/get.dart';
import 'package:victous/services/repository.dart';
import '../State/auth_state.dart';
import '../Utils/constants.dart';
import '../Utils/logger.dart';
import '../model/home_notifier.dart';
import 'main_view.dart';



class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});
  static const String routeName = '/LoginView';

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {

  TextEditingController userIdCntrl = TextEditingController();
  TextEditingController passwdCntrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    
    final authState = ref.watch(authProvider);

    Logger.logger("authstate:::${authState.isLoggedIn}");

    ref.listen<AuthState>(authProvider, (prev, next){
      if(next.isLoggedIn){
        Logger.showWarningAlert("Alert", "Logged In Successfully");
        ref.read(homeProvider.notifier).load();
        Get.offAllNamed(Main.routeName);
      } else if(next.isLoggedIn == false){
        Logger.showWarningAlert("Alert", "Invalid Credentials");
      }
      else if (next.error != ''){
        Logger.showWarningAlert("Alert", next.error!);
      }

        });

    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title: const Text("Login", style: TextStyle(color: Colors.white),),),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                const SizedBox(height: 20,),

                Container(
                  height: 120,
                  width: 250,
                  child: Image.asset('${Constants.ImagePath}logo.png'),
                ),

                TextFormField(
                  controller: userIdCntrl,
                  validator: (val) {
                    if(val!.isEmpty){
                      return 'Please Enter Valid User Id';
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)
                    ),
                    hintText: 'Enter User Id',
                    labelText: 'User Id',

                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField(
                  controller: passwdCntrl,
                  validator: (val) {
                    if(val!.isEmpty){
                      return 'Please Enter Valid Password';
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black)
                    ),
                    hintText: 'Enter Passwprd',
                    labelText: 'Password',

                  ),
                ),

               const  SizedBox(height: 30,),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor
                  ),
                  onPressed:
                      authState.isLoading
                      ? null
                      : (){
                    if(_formKey.currentState!.validate()){
                      if(userIdCntrl.text.trim() != '' && passwdCntrl.text.trim() != ''){
                       ref.read(authProvider.notifier).login(userIdCntrl.text, passwdCntrl.text, "Associate");
                      }

                    } else{
                      Logger.showWarningAlert("Alert", "Please Fill All Details");
                    }

                  },
                  child: authState.isLoading
                  ? const CircularProgressIndicator()
                  : const Text("Submit",style: TextStyle(color: Colors.white),),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}



