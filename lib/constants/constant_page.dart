import 'package:portfolio/models/model_page.dart';
import 'package:portfolio/pages/page_about.dart';
import 'package:portfolio/pages/page_contacts.dart';
import 'package:portfolio/pages/page_main.dart';
import 'package:portfolio/pages/page_projects.dart';

class ConstantPage {
  static const List<ModelPage> pages = [
    ModelPage(
      subject: 'home',
      route: '/',
      page: PageMain(),
    ),
    ModelPage(
      subject: 'about',
      route: '/about',
      page: PageAbout(),
    ),
    ModelPage(
      subject: 'projects',
      route: '/projects',
      page: PageProjects(),
    ),
    ModelPage(
      subject: 'contacts',
      route: '/contacts',
      page: PageContacts(),
    ),
  ];
}
