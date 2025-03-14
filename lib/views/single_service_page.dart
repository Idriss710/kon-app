import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kon/widgets/custom_widgets/cusom_side_bar.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_course_list_card.dart';
import 'package:kon/widgets/custom_widgets/custom_expandable_text.dart';
import 'package:kon/widgets/custom_widgets/custom_post_card.dart';
import 'package:kon/widgets/custom_widgets/custom_search_text_field.dart';
import 'package:kon/widgets/custom_widgets/custom_up_part_of_single_course_page.dart';
import 'package:kon/widgets/custom_widgets/custom_up_part_of_single_group_page.dart';
import 'package:kon/widgets/profile_screen_section/cover_and_photo_for_group.dart';

class SingleServicePage extends StatefulWidget {
  const SingleServicePage({Key? key}) : super(key: key);

  @override
  _SingleServicePageState createState() => _SingleServicePageState();
}

class _SingleServicePageState extends State<SingleServicePage> {
  final TextEditingController searchTextEditingController =
      TextEditingController();
  final List<String> imagesUrlList = [
    "assets/images/kon.png",
    "assets/images/kon.png",
    "assets/images/kon.png",
    "assets/images/kon.png",
    "assets/images/kon.png",
    "assets/images/kon.png",
  ];

  Widget ImagesGredView(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              // mainAxisSpacing: 0,
              crossAxisSpacing: 8),
        itemCount: imagesUrlList.length,
        itemBuilder: (context, index) {
          // return Image.network('src')
          return Image.asset(
            imagesUrlList[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Service Details',
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ////////////////////// Service Title ///////////////////////

                const Text(
                  'Service Name sfdfsdfsd',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),

                ////////////////////// Cover Image ///////////////////////
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  // color: Colors.grey,
                  // Image.network()
                  child: Image.asset(
                    "assets/images/coverImage.jpg",
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                ////////////////////// about the service ///////////////////////
                const Text(
                  'About The Service',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                    'this services ..sdf.s.df.sdf.sd.fs.df.sd.fs.df.sdf.sdfsdfsdf.sdfsdfsdfjj alksdjf lkjdsfljla;ksdjf8ojwekfjosdhfaakjeofihanskjfoa ehefo sfdj ioke nflsjdhfo ;l'),
                SizedBox(
                  height: 20,
                ),

                //   ////////////////////// deliver time ///////////////////////
                //   const Text('Estimated Delivery Time ',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                //   SizedBox(height: 10,),
                //   Text('this services ..sdf.s.df.sdf.sd.fs.df.sd.fs.df.sdf.sdfsdfsdf.sdfsdfsdfjj alksdjf lkjdsfljla;ksdjf8ojwekfjosdhfaakjeofihanskjfoa ehefo sfdj ioke nflsjdhfo ;l'),
                //  SizedBox(height: 20,),

                Divider(color: Colors.grey,),
                ////////////////////// Service price ///////////////////////
                const Text(
                  'Service price',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('120 Doular',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                Divider(color: Colors.grey,),

                ////////////////////// previous works images ///////////////////////
                 SizedBox(
                  height: 10,
                ),
                 const Text(
                  'Previous Works Images',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                ImagesGredView(context),

                ///////////////// Button For Request the service //////////////////////////////////
                CustomButton(
                  text: 'Request The Service',
                  backgroundColor: Colors.green,
                  borderRadius: 20,
                  width: MediaQuery.of(context).size.width,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton:CustomButton(text: 'Add Video',
      //   backgroundColor: Colors.green,
      //   onPressed:() {

      // },) ,
    );
  }
}
