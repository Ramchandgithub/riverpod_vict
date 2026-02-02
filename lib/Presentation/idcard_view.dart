import 'dart:io';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/Material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';
import 'package:victous/Presentation/main_view.dart';
import 'package:victous/services/repository.dart';
import 'package:victous/widgets/leading_icon.dart';

import '../../Utils/constants.dart';
import '../../Utils/logger.dart';
import '../../widgets/sub_child_item.dart';
import '../Controllers/profile_notifier.dart';

class IDCardView extends ConsumerStatefulWidget {
  static const String routeName = '/IDCardView';
  const IDCardView({super.key});

  @override
  ConsumerState<IDCardView> createState() => _ConsumerIDCardViewState();
}

class _ConsumerIDCardViewState extends ConsumerState<IDCardView> {

  ScreenshotController screenshotController = ScreenshotController();

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  }

  _backpress(){
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    Get.back();
  }

  saveToGallary() async {

    await screenshotController.capture(delay: const Duration(milliseconds: 10)).then((var image) async {
      if (image != null) {
        Logger.logger("image avialable");
        Random random = Random();
        final directory = await getTemporaryDirectory();
        final imagePath = await File('${directory.path}/IDCard${random.nextInt(10000)}.png').create();
        await imagePath.writeAsBytes(image);
        Logger.logger(imagePath.path.toString());
        await Share.shareXFiles([XFile('${imagePath.path}')]);
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    final ProfileData = ref.watch(profileProvider);


    return WillPopScope(
      onWillPop: () =>  _backpress(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("ID Card",style: TextStyle(color: Colors.white, fontSize: 16),),
          leading: const LeadingIcon()
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.share),onPressed: (){
          saveToGallary();
        },),
        body: SingleChildScrollView(
            child: Screenshot(
              controller: screenshotController,
              child:  Padding(
                padding: EdgeInsets.all(20),

                    child:  Container(
                      height: MediaQuery.of(context).size.height/1.5,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(1),
                      //color: Theme.of(context).primaryColor,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5),
                        ),
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).primaryColor,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: Stack(
                        children: [
                          Container(

                            child: Image.asset(
                              "${Constants.ImagePath}IDbackground.jpg",
                              fit: BoxFit.fill,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                            ) ,
                          ),
                          Container(
                            padding: MediaQuery.of(context).size.width > 650
                                ? EdgeInsets.only(top: 200) :EdgeInsets.only(top: 120),
                            alignment: Alignment.center,
                            child: Column(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(100),
                                      ),
                                      child: Center(
                                        child: CachedNetworkImage(
                                          imageUrl: "${Constants.profilepic_url}${ ProfileData.profileData[0]?.memPhoto?? ''}",
                                          // imageUrl: "${Constants.profilepic_url}${args["memPhoto"] ?? ''}",
                                          height: 150,
                                          width: 135,
                                          fit: BoxFit.fill,
                                          placeholder: (context, url) =>
                                          const Align(
                                            alignment: Alignment.center,
                                            child: SizedBox(
                                              height: 150,
                                              width: 120,
                                              child: Center(
                                                child:
                                                CircularProgressIndicator(),
                                              ),
                                            ),
                                          ),
                                          errorWidget:
                                              (context, url, error) =>
                                              Image.asset(
                                                '${Constants.ImagePath}NoImage.png',
                                                width: 60,
                                                height: 60,
                                                fit: BoxFit.fill,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Container(
                                  padding: MediaQuery.of(context).size.width > 650
                                      ? EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width / 4)
                                      : EdgeInsets.only(
                                      left: MediaQuery.of(context).size.width / 10),
                                  child: Column(
                                    children: [
                                      SubChildItem4("NAME ",
                                          "${ProfileData.profileData[0]?.name}", false),
                                      SubChildItem4("EMAIL ",
                                          ProfileData.profileData[0]?.eMail ?? '', false),
                                      SubChildItem4("CONTACT ",
                                          ProfileData.profileData[0]?.mobile ?? '', false),
                                      SubChildItem4(
                                          "RANK ", ProfileData.profileData[0]?.rankName ?? '', false),

                                      //need to change according to response
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )

              )

            )
        ),
      ),
    );
  }
}
class BulletList extends StatelessWidget {
  final List<String> strings;

  BulletList(this.strings);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      // padding: EdgeInsets.fromLTRB(16, 15, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: strings.map((str) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\u2022',
                    style: TextStyle(
                      fontSize: 14,
                      height: 2,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    child: Container(
                      child: Text(
                        str,
                        textAlign: TextAlign.left,
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black.withOpacity(0.6),
                          height: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4,)
            ],
          );
        }).toList(),
      ),
    );
  }
}
