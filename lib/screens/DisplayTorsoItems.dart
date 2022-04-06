import 'package:flutter/material.dart';
import 'package:humanoid_ctse/services/TorsoServices.dart';
import 'package:humanoid_ctse/widgets/DisplayItemCardWidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DisplayTorsoItems extends StatefulWidget {
  static const routeName = '/display-torso';

  const DisplayTorsoItems({Key? key}) : super(key: key);

  @override
  State<DisplayTorsoItems> createState() => _DisplayTorsoItemsState();
}

class _DisplayTorsoItemsState extends State<DisplayTorsoItems> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  late TorsoServices torsoServices;
  List docs = [];

  initialise() {
    torsoServices = TorsoServices();
    torsoServices.initialise();
    torsoServices.getData().then((value) => {
      setState((){
        docs = value;
      })
    });
  }

  @override
  void initState() {
    super.initState();
    initialise();
  }

  void _onRefresh() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    initialise();
    _refreshController.refreshCompleted();
  }

  void _onLoading() async{
    // monitor network fetch
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 180,
              width: double.infinity,
              child: DecoratedBox(
                decoration:
                    const BoxDecoration(color: Color.fromARGB(255, 1, 77, 123)),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(18.0, 0, 0, 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/torso_white.png'),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(18.0, 10.0, 0, 0),
                              child: Text(
                                "Torso",
                                style: TextStyle(
                                    fontFamily: "Tenorite",
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50),
                                textAlign: TextAlign.start,
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                    itemCount: docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      return DisplayItemCardWidget(
                          imageUrl: docs[index]['imageURL'],
                          name: docs[index]['name'],
                          description: docs[index]['description'],
                          diseases: docs[index]['diseases']
                      );
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
