import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:touchable/touchable.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = '/about-screen';
  const AboutScreen({Key? key}) : super(key: key);

  showThushalAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Kulatilake T. T."),
      content: SizedBox(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("-> Software Engineering - SLIIT"),
            const SizedBox(
              height: 10,
            ),
            const Text("-> IT19043456"),
            const SizedBox(
              height: 10,
            ),
            const Text("-> Colombo"),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.facebook,
                    size: 40,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    launch("https://www.facebook.com/thushal.kulatilake/");
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.pink,
                    size: 40,
                  ),
                  onPressed: () {
                    launch("https://www.instagram.com/thushaltk/");
                  },
                ),
                 const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.linkedin,
                    color: Color.fromARGB(255, 11, 62, 152),
                    size: 40,
                  ),
                  onPressed: () {
                    launch("https://www.linkedin.com/in/thushaltk/");
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.github,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 40,
                  ),
                  onPressed: () {
                    launch("https://github.com/thushaltk");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showEishanAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Eishan Dinuka W. H. A"),
      content: SizedBox(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("-> Software Engineering - SLIIT"),
            const SizedBox(
              height: 10,
            ),
            const Text("-> IT18118896"),
            const SizedBox(
              height: 10,
            ),
            const Text("-> Middeniya"),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.facebook,
                    size: 40,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    launch("https://www.facebook.com/eishandinuka.weerasinghe.12/");
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.pink,
                    size: 40,
                  ),
                  onPressed: () {
                    launch("https://www.instagram.com/eishan_dinuka/");
                  },
                ),
                 const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.linkedin,
                    color: Color.fromARGB(255, 11, 62, 152),
                    size: 40,
                  ),
                  onPressed: () {
                    launch("https://www.linkedin.com/in/w-h-a-eishan-dinuka-08a2b8199/");
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.github,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 40,
                  ),
                  onPressed: () {
                    launch("https://github.com/Eishan-Dinuka-IT18118896/");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  
  showRusiraAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Liyanage P. L. R. S"),
      content: SizedBox(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("-> Software Engineering - SLIIT"),
            const SizedBox(
              height: 10,
            ),
            const Text("-> IT19022734"),
            const SizedBox(
              height: 10,
            ),
            const Text("-> Kadawatha"),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.facebook,
                    size: 40,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    launch("https://www.facebook.com/rusira.liyanage/");
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.pink,
                    size: 40,
                  ),
                  onPressed: () {
                    launch("https://www.instagram.com/rusira_liyanage/");
                  },
                ),
                 const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.linkedin,
                    color: Color.fromARGB(255, 11, 62, 152),
                    size: 40,
                  ),
                  onPressed: () {
                    launch("https://www.linkedin.com/in/rusira-senath-liyanage/");
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.github,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 40,
                  ),
                  onPressed: () {
                    launch("https://github.com/Rusira1234/");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showKishenAlertDialog(BuildContext context) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Deemud G. H. K."),
      content: SizedBox(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("-> Software Engineering - SLIIT"),
            const SizedBox(
              height: 10,
            ),
            const Text("-> IT19043524"),
            const SizedBox(
              height: 10,
            ),
            const Text("-> Ganemulla"),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.facebook,
                    size: 40,
                  ),
                  color: Colors.blue,
                  onPressed: () {
                    launch("https://www.facebook.com/kishen.deemud/");
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.pink,
                    size: 40,
                  ),
                  onPressed: () {
                    launch("https://www.instagram.com/kish_deemu/");
                  },
                ),
                 const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.linkedin,
                    color: Color.fromARGB(255, 11, 62, 152),
                    size: 40,
                  ),
                  onPressed: () {
                    launch("https://www.linkedin.com/in/kishen-deemud/");
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  icon: const Icon(
                    FontAwesomeIcons.github,
                    color: Color.fromARGB(255, 0, 0, 0),
                    size: 40,
                  ),
                  onPressed: () {
                    launch("https://github.com/kishdeemu/");
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.asset('assets/images/logo.png', width: double.infinity),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 15.0),
          child: Text(
            "Development Team",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontSize: 23,
              fontFamily: 'Tenorite',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showThushalAlertDialog(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      'assets/images/thushal.jpeg',
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showEishanAlertDialog(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      'assets/images/eishan.jpg',
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                showKishenAlertDialog(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      'assets/images/kishen.jpg',
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showRusiraAlertDialog(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(100.0)),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.asset(
                      'assets/images/rusira.jpeg',
                      width: double.infinity,
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
