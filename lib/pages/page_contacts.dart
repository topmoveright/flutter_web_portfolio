import 'package:flutter/material.dart';
import 'package:portfolio/constants/constant_info.dart';
import 'package:portfolio/constants/constant_size.dart';
import 'package:portfolio/constants/constant_text_style.dart';
import 'package:portfolio/layout.dart';
import 'package:url_launcher/url_launcher.dart';

class PageContacts extends StatefulWidget {
  const PageContacts({Key? key}) : super(key: key);

  @override
  State<PageContacts> createState() => _PageContactsState();
}

class _PageContactsState extends State<PageContacts> {
  late TextEditingController tecName;
  late TextEditingController tecMail;
  late TextEditingController tecMessage;

  _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {
    super.initState();

    tecName = TextEditingController();
    tecMail = TextEditingController();
    tecMessage = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    tecName.dispose();
    tecMail.dispose();
    tecMessage.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Padding(
        padding: const EdgeInsets.all(ConstantSize.big),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Get in touch',
              style: ConstantTextStyle.fontPressStart2P.copyWith(
                fontSize: ConstantSize.big,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: ConstantSize.big),
            const Text(
              'If you wanna get in touch, talk to me about a project collaboration or just say hi,'
              'fill up the awesome form below or send an email to ${ConstantInfo.mail} '
              'and ~let\'s talk.',
              style: TextStyle(
                fontSize: ConstantSize.x3,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: ConstantSize.big),
            const Divider(),
            const SizedBox(height: ConstantSize.big),
            TextField(
              controller: tecName,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Name',
              ),
            ),
            const SizedBox(height: ConstantSize.x3),
            TextField(
              controller: tecMail,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.mail),
                hintText: 'Email Address',
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: ConstantSize.x3),
            TextField(
              controller: tecMessage,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.create),
                hintText: 'Message',
              ),
              minLines: 5,
              maxLines: null,
            ),
            const SizedBox(height: ConstantSize.big),
            ButtonBar(
              children: [
                ElevatedButton.icon(
                  onPressed: () => _launchURL(
                    ConstantInfo.mail,
                    tecName.text,
                    tecMessage.text,
                  ),
                  icon: const Icon(Icons.send),
                  label: const Text('Send'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
