
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:victous/Presentation/main_view.dart';
import 'package:victous/Widgets/leadingIconWidget.dart';
import 'package:victous/Widgets/sub_child_item.dart';
import 'package:victous/Widgets/sub_header.dart';

import '../Controllers/profile_notifier.dart';

class ProfileView extends ConsumerStatefulWidget {
  const ProfileView({super.key});
  static const String routeName = '/ProfileView';

  @override
  ConsumerState<ProfileView> createState() => _ConsumerProfileViewState();
}

class _ConsumerProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final ProfileData = ref.watch(profileProvider);

    return ProfileData.isLoading == true ? const Center(child: CircularProgressIndicator(),)
     :  Scaffold(
      appBar: AppBar(
        leading: LeadingIconWidget(),
        title: Text("Profile", style: TextStyle(color: Colors.white),),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: [
              SubHeader("Sponsor Details"),
              Card(
                elevation: 3,
                child: SubChildItem("Sponsor ID", "${ProfileData.profileData[0]!.sponsor}", false),
              ),

              const SizedBox(height: 10,),
              SubHeader("Personal Details"),
              Card(
                elevation: 3,
                child:Column(
                  children: [
                    SubChildItem("Associate ID", "${ProfileData.profileData[0]!.sponsor}", false),
                    SubChildItem("Title", "${ProfileData.profileData[0]!.title}", false),
                    SubChildItem("Name", "${ProfileData.profileData[0]!.name}", false),
                    SubChildItem("Gender", "${ProfileData.profileData[0]!.gender}", false),
                    SubChildItem("Date Of Birth", ProfileData.profileData[0]?.dob ?? '', false),
                    SubChildItem("PAN", ProfileData.profileData[0]?.panno ?? '', false),
                    SubChildItem("Account No", ProfileData.profileData[0]?.accno ?? '', false),
                    SubChildItem("Bank Name", ProfileData.profileData[0]?.bank ?? '', false),
                    SubChildItem("Branch Name", ProfileData.profileData[0]?.branch ?? '', false),
                    SubChildItem("IFSC", ProfileData.profileData[0]?.ifscode ?? '', false),
                  ],
                )
              ),

              const SizedBox(height: 10,),
              SubHeader("Correspondance Address"),
              Card(
                  elevation: 3,
                  child:Column(
                    children: [
                      SubChildItem("Address", "${ProfileData.profileData[0]!.address1}", false),
                      SubChildItem("Pincode", "${ProfileData.profileData[0]!.pinCode}", false),
                      SubChildItem("District", "${ProfileData.profileData[0]!.districtName}", false),
                      SubChildItem("City", "${ProfileData.profileData[0]!.city}", false),
                      SubChildItem("State", ProfileData.profileData[0]!.state.toString()  , false),
                      SubChildItem("Mobile No", ProfileData.profileData[0]?.mobile ?? '', false),
                      SubChildItem("Email", ProfileData.profileData[0]?.eMail ?? '', false),

                    ],
                  )
              ),

              const SizedBox(height: 10,),
              SubHeader("Nominee Details"),
              Card(
                  elevation: 3,
                  child:Column(
                    children: [
                      SubChildItem("Full Name", "${ProfileData.profileData[0]!.name}", false),
                      SubChildItem("Relation With Applicant ", "${ProfileData.profileData[0]!.relation}", false),
                      SubChildItem("Age ", "${ProfileData.profileData[0]!.nomineeAge}", false),

                    ],
                  )
              ),

              const SizedBox(height: 10,),



            ],
          ),
        ),
      ),
    );
  }
}
