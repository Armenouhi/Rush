import 'package:exam_at/providers/purchases_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Purchases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _buildContent();
  }

  Widget _buildContent() {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => PurchasesProvider(),
        child: Consumer<PurchasesProvider>(
          builder: (context, value, child) => value.isLoading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : Scaffold(
                  appBar: AppBar(
                    title: const Center(
                      child: Text(
                        'Purchases',
                        style: TextStyle(color: Color.fromRGBO(0, 153, 0, 0.8)),
                      ),
                    ),
                    iconTheme: const IconThemeData(
                        color: Color.fromRGBO(0, 153, 0, 0.8)),
                  ),
                  body: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: const Color.fromRGBO(0, 153, 0, 0.8),
                        width: 5,
                      ),
                    ),
                    child: ListView.builder(
                      itemCount: value.purchases?.length,
                      itemBuilder: (context, index) => Container(
                       
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 5, bottom: 5),
                          child: Stack(
                            children: <Widget>[ Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                side: const BorderSide(
                                  color: Color.fromARGB(255, 189, 187, 187),
                                
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(7),
                                    child: SizedBox(
                                      width: value.purchases![index].showBadge == true 
                                          ? 110 : 120,
                                      height: value.purchases![index].showBadge == true 
                                          ? 110 : 120,
                                      child: Card(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12.0),
                                        ),
                                        color: value.colors[index],
                                        child: Padding(
                                          padding: const EdgeInsets.all(7),
                                          child: Card(
                                            color: value.colors[index],
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              side: const BorderSide(
                                                color: Colors.white, 
                                              ),
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(7),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    '${value.purchases![index].playsCount}',
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18),
                                                  ),
                                                  const Text(
                                                    'Plays',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 13),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        '${value.purchases![index].title}',
                                        style: TextStyle(
                                            color: value.colors[index],
                                            fontSize: 20),
                                      ),
                                      Text(
                                        value.purchases![index].showBadge == true
                                          ? '${value.purchases![index].subTitle}'
                                          : '${value.purchases![index].price}\$',
                                        style: const TextStyle(
                                            color: Colors.grey, fontSize: 18),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 7),
                                    child: Container(
                                      child: Text(
                                        value.purchases![index].showBadge == true 
                                          ? '${value.purchases![index].price}\$'
                                          : '',
                                        style: TextStyle(
                                          color: value.colors[index],
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          
                             Align(
                                alignment: Alignment.topLeft,
                                child: 
                                  value.purchases![index].showBadge == true
                                    ? Image.asset('assets/group4428.png')
                                    : Container()
                              )
                            ]
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}