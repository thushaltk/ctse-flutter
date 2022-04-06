import 'package:flutter/material.dart';
import 'package:humanoid_ctse/screens/AddHeadPartsScreen.dart';
import 'package:humanoid_ctse/services/HeadServices.dart';
import 'package:humanoid_ctse/widgets/ItemLongCardWidget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DashboardHeadScreen extends StatefulWidget {
  static const routeName = '/admin-head';

  const DashboardHeadScreen({Key? key}) : super(key: key);

  @override
  State<DashboardHeadScreen> createState() => _DashboardHeadScreenState();
}

class _DashboardHeadScreenState extends State<DashboardHeadScreen> {
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  late HeadServices headServices;
  List docs = [];

  initialise() {
    headServices = HeadServices();
    headServices.initialise();
    headServices.getData().then((value) => {
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
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddHeadPartsScreen.routeName);
          },
          child: const Icon(Icons.add)),
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
                            Image.asset('assets/images/head_white.png'),
                            const Padding(
                              padding: EdgeInsets.fromLTRB(18.0, 10.0, 0, 0),
                              child: Text(
                                "Head",
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
                      return ItemLongCardWidget(
                        service: headServices,
                        parentName: "HEADS",
                          id: docs[index]['id'],
                          imageUrl: docs[index]['imageURL'],
                          name: docs[index]['name'],
                          description: docs[index]['description'],
                          diseases: docs[index]['diseases']);
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
