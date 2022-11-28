import 'package:erigo/screen/home/Home.dart';
import 'package:erigo/screen/wishlist-page/models/wishlist_db.dart';
import 'package:erigo/screen/wishlist-page/models/wishlist_model.dart';
import 'package:erigo/utils/Constant.dart';
import 'package:flutter/material.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({Key? key}) : super(key: key);

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  List<WishlistModel> dataListWishlist = [];
  bool isLoading = false;

  Future read() async {
    setState(() {
      isLoading = true;
    });
    dataListWishlist = await WishlistDatabase.instance.readAll();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    read();
  }

  showDeleteDialog(BuildContext context, String? name) {
    // set up the button
    Widget cancelButton = TextButton(
        child: Text("Tidak"),
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop('dialog');
        }
    );
    Widget okButton = TextButton(
        child: Text("Hapus"),
        onPressed: () {
          setState(() {
            isLoading = true;
          });
          WishlistDatabase.instance.delete(name);
          read();
          setState(() {
            isLoading = false;
          });
          Navigator.push(context, MaterialPageRoute(builder:(context) => MyHomePage()));
          Navigator.pop(context);
          Navigator.of(context, rootNavigator: true).pop('dialog');

        });

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: Text("Apakah anda yakin ingin menghapus?"),
      actions: [cancelButton, okButton],
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          'Wishlist',
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        )),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : dataListWishlist.isEmpty
              ? Center(
                  child: Text('Wishlist is empty'),
                )
              : ListView.builder(
                  itemCount: dataListWishlist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      decoration: BoxDecoration(
                        color: Color(0xffF1F2ED),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 80,
                              width: 60,
                              child: Container(
                                child: Image.asset(
                                  dataListWishlist[index].image!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${dataListWishlist[index].title}',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'Rp. ${dataListWishlist[index].price}00',
                                    style: TextStyle(
                                      color: Styles.secondaryColor,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: (){
                                showDeleteDialog(context, dataListWishlist[index].title);
                              },
                              icon: Icon(Icons.delete),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
