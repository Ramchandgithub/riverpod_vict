
import 'package:flutter_riverpod/legacy.dart';

enum DrawerMenu{
  dashboard,
  profile,
  changePswd,
  idCard,
  uploadBnkDtls,
  uploadPan,
  uploadKyc,
  visitingCard,
  rankCertificate,
  welcomeLetter,
  verifyEmail,
  uploadGst,
  myRankAchv,


  genealogy,
  referral,
  visual,
  tabular,
  myTeam,
  myCustomers,


  wallet,
  creditRqst,
  creditReport,
  transfer,


  orders,
  orderRpt,
  archivedRpt,

  tools,
  downloads,
  eventCreation,
  community,
  notification,

  support,
  newTkt,
  mytkt,


  payout,
  payableRpt,
  payoutHold,
  tds,
  archivePayout,


  reward,
  tourAcheiversdtls,

  signUp,
  contactUs,
  aboutUs,
  privacy,
  terms,
  logout,
  login,

}
final drawerMenuProvider = StateProvider<DrawerMenu?>((ref) => null);