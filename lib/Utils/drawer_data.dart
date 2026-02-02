import 'package:flutter/material.dart';

import '../Widgets/main_drawer.dart';
import 'constants.dart';
import 'drawer_enum.dart';

final List<DrawerItem> loggedOutDrawer = [
  DrawerItem(menu: DrawerMenu.login, title: "Login", icon: Icons.login),
  DrawerItem(menu: DrawerMenu.signUp, title: "Sign Up", icon: Icons.eighteen_mp),
  DrawerItem(menu: DrawerMenu.contactUs, title: "Contact Us", icon: Icons.phone),
  DrawerItem(menu: DrawerMenu.aboutUs, title: "About Us", icon: Icons.person_add_alt_rounded),
  DrawerItem(menu: DrawerMenu.privacy, title: "Privacy Policy", icon: Icons.privacy_tip),
  DrawerItem(menu: DrawerMenu.terms, title: "Terms & Conditions", icon: Icons.terminal),

];



final List<DrawerSection> loggedInDrawer = [

  DrawerSection(
    title: "Dashboard",
    header: DrawerItem(
      menu: DrawerMenu.dashboard,
      title: "Dashboard",
      asset: "${Constants.IconPath}profile.png",
    ),
    children: [],
  ),


  DrawerSection(
    title: "Profile",
    header: DrawerItem(
      menu: DrawerMenu.profile,
      title: "Profile",
      asset: "${Constants.IconPath}profile.png",
    ),
    children: [
      DrawerItem(menu: DrawerMenu.profile, title: "View Profile", asset: "${Constants.IconPath}profile.png"),
      DrawerItem(menu: DrawerMenu.changePswd, title: "Change Password", icon: Icons.password),
      DrawerItem(menu: DrawerMenu.idCard, title: "ID Card", asset: "${Constants.IconPath}idcard.png"),
      DrawerItem(menu: DrawerMenu.uploadBnkDtls, title: "Upload Bank Details", asset: "${Constants.IconPath}cb.png"),
      DrawerItem(menu: DrawerMenu.uploadPan, title: "Upload PAN", asset: "${Constants.IconPath}idca.png"),
      DrawerItem(menu: DrawerMenu.uploadKyc, title: "Upload KYC", asset: "${Constants.IconPath}customer.png"),
    ],
  ),

  DrawerSection(
    title: "Genealogy",
    header: DrawerItem(
      menu: DrawerMenu.genealogy,
      title: "Genealogy",
      asset: "${Constants.IconPath}group.png",
    ),
    children: [
      DrawerItem(menu: DrawerMenu.referral, title: "Direct Referral"),
      DrawerItem(menu: DrawerMenu.visual, title: "Visual Genealogy"),
      DrawerItem(menu: DrawerMenu.tabular, title: "Tabular Genealogy"),
    ],
  ),


  DrawerSection(
    title: "My Wallet",
    header: DrawerItem(
      menu: DrawerMenu.wallet,
      title: "My Wallet",
      asset: "${Constants.IconPath}profile.png",
    ),
    children: [
      DrawerItem(menu: DrawerMenu.wallet, title: "Shopping MyWallet", asset: "${Constants.IconPath}profile.png"),
      DrawerItem(menu: DrawerMenu.creditRqst, title: "Credit Request", icon: Icons.password),
      DrawerItem(menu: DrawerMenu.creditReport, title: "Credit Request Report", asset: "${Constants.IconPath}idcard.png"),
      DrawerItem(menu: DrawerMenu.transfer, title: "Transfer Wallet for Downline Member", asset: "${Constants.IconPath}cb.png"),
    ],
  ),
  DrawerSection(
    title: "My Orders",
    header: DrawerItem(
      menu: DrawerMenu.orders,
      title: "My Orders",
      asset: "${Constants.IconPath}profile.png",
    ),
    children: [
      DrawerItem(menu: DrawerMenu.orders, title: "Order Now", asset: "${Constants.IconPath}profile.png"),
      DrawerItem(menu: DrawerMenu.orderRpt, title: "Orders Report", icon: Icons.password),
      DrawerItem(menu: DrawerMenu.archivedRpt, title: "Archived Report", asset: "${Constants.IconPath}idcard.png"),
       ],
  ),
  DrawerSection(
    title: "Tools",
    header: DrawerItem(
      menu: DrawerMenu.tools,
      title: "Tools",
      asset: "${Constants.IconPath}profile.png",
    ),
    children: [
      DrawerItem(menu: DrawerMenu.downloads, title: "Downloads", asset: "${Constants.IconPath}profile.png"),
      DrawerItem(menu: DrawerMenu.eventCreation, title: "Event Creation", icon: Icons.password),
      DrawerItem(menu: DrawerMenu.community, title: "Community Building", asset: "${Constants.IconPath}idcard.png"),
      DrawerItem(menu: DrawerMenu.notification, title: "Notification Report", asset: "${Constants.IconPath}idcard.png"),
       ],
  ),
  DrawerSection(
    title: "Support Ticket",
    header: DrawerItem(
      menu: DrawerMenu.support,
      title: "Support Ticket",
      asset: "${Constants.IconPath}profile.png",
    ),
    children: [
      DrawerItem(menu: DrawerMenu.newTkt, title: "Create New Ticket", asset: "${Constants.IconPath}profile.png"),
      DrawerItem(menu: DrawerMenu.mytkt, title: "My Tickets", icon: Icons.password),
       ],
  ),
  DrawerSection(
    title: "Payout Menu",
    header: DrawerItem(
      menu: DrawerMenu.payout,
      title: "Payout Menu",
      asset: "${Constants.IconPath}profile.png",
    ),
    children: [
      DrawerItem(menu: DrawerMenu.payableRpt, title: "Payable Report", asset: "${Constants.IconPath}profile.png"),
      DrawerItem(menu: DrawerMenu.payoutHold, title: "Payout On Hold", icon: Icons.password),
      DrawerItem(menu: DrawerMenu.tds, title: "TDS Report", icon: Icons.password),
      DrawerItem(menu: DrawerMenu.archivedRpt, title: "Archived Payout Report", icon: Icons.password),
       ],
  ),
  DrawerSection(
    title: "Reward Manager",
    header: DrawerItem(
      menu: DrawerMenu.reward,
      title: "Reward Manager",
      asset: "${Constants.IconPath}profile.png",
    ),
    children: [
      DrawerItem(menu: DrawerMenu.tourAcheiversdtls, title: "Tour Achievers Details", asset: "${Constants.IconPath}profile.png"),

       ],
  ),
];
