import 'package:intl/intl.dart';
import 'package:workshops_app/app/core/theme/colors.app.dart';
import 'package:workshops_app/app/data/models/attendanceSheetCollaborator.dart';
import 'package:workshops_app/app/modules/workshop/controller.dart';
import 'package:workshops_app/app/routes/routes.dart';
import 'package:workshops_app/app/widgets/button.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class WorkshopPage extends GetView<WorkshopController> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Scaffold(
      appBar: AppBar(
        title: Text("",
            style: GoogleFonts.poppins(
              textStyle: const TextStyle(
                color: ColorsApp.appTitle,
                fontSize: 20,
              ),
            )),
        centerTitle: true,
        surfaceTintColor: Colors.white,
        backgroundColor: ColorsApp.appBackground,
        shape: const Border(
            bottom: BorderSide(color: ColorsApp.appBorder, width: 0.5)),
      ),
      body: controller.obx(
        (state) => SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: SizedBox(
            child: Column(
              children: [
                const Text(
                  "Detalhes do workshop",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                      color: Colors.black87),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(0),
                  child: Column(
                    children: [
                      for (var donation in state!)
                        Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 0),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                            ),
                            elevation: 4,
                            shadowColor: Colors.blueGrey,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 20, left: 20),
                                              child: Text(
                                                "Workshop: ${donation.name}",
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: 'Roboto',
                                                    color: Colors.black87),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5, left: 20),
                                              child: Text(
                                                "Data de realização: ${DateFormat.yMd().format(donation.dateCompletion)}",
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Roboto',
                                                    color: Colors.black87),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5, left: 20),
                                              child: Text(
                                                "Descricão: ${donation.description}",
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Roboto',
                                                    color: Colors.black87),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Padding(
                                              padding: EdgeInsets.only(
                                                  top: 5, left: 20),
                                              child: Text(
                                                "Colaboradores:",
                                                style: const TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: 'Roboto',
                                                    color: Colors.black87),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                for (var attendanceSheet
                                    in donation.attendanceSheet) ...[
                                  for (var attendanceSheetCollaborator
                                      in attendanceSheet
                                          .attendanceSheetCollaborator!) ...[
                                    const SizedBox(
                                      height: 1,
                                    ),
                                    Container(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.only(top: 5, left: 20),
                                        child: Text(
                                          "- ${attendanceSheetCollaborator.collaborator.name}",
                                          style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'Roboto',
                                              color: Colors.black87),
                                        ),
                                      ),
                                    ),
                                  ]
                                ],
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
