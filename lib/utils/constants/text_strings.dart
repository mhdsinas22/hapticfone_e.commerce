import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

String generteOrderid() {
  final now = DateTime.now();
  return "ORD${now.millisecondsSinceEpoch}";
}

String dateandtimefomrat() {
  DateTime date = DateTime.now();
  String fromateddate = DateFormat("d MMM yyyy").format(date);
  return fromateddate;
}

String timeformat() {
  DateTime date = DateTime.now();
  String formattime = DateFormat("h:mm a").format(date);
  return formattime;
}

void openinstagrma() async {
  final url = Uri.parse("https://instagram.com/haptic.fone");
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}

void openwhatsapp() async {
  final url = Uri.parse("https://wa.me/7034266250");
  if (await canLaunchUrl(url)) {
    await launchUrl(url, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
