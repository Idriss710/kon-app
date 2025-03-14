import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:kon/widgets/custom_widgets/custom_button.dart';
import 'package:kon/widgets/custom_widgets/custom_date_picker.dart';
import 'package:kon/widgets/custom_widgets/custom_text_field.dart';
import 'package:multi_image_picker_plus/multi_image_picker_plus.dart';
import 'package:permission_handler/permission_handler.dart';


class EditProjectPage extends StatefulWidget {
  const EditProjectPage({super.key});

  @override
  State<EditProjectPage> createState() => _EditProjectPageState();
}

class _EditProjectPageState extends State<EditProjectPage> {

    final TextEditingController _postController = TextEditingController();

  List<Asset> images = <Asset>[];
  String _error = 'No Error Dectected';
  bool _permissionReady = false;
  AppLifecycleListener? _lifecycleListener;
  static const List<Permission> _permissions = [
    Permission.storage,
    Permission.camera
  ];

  Future<void> _requestPermissions() async {
    final Map<Permission, PermissionStatus> statues =
        await _permissions.request();
    if (statues.values.every((status) => status.isGranted)) {
      _permissionReady = true;
    }
  }

  Future<void> _checkPermissions() async {
    _permissionReady = (await Future.wait(_permissions.map((e) => e.isGranted)))
        .every((isGranted) => isGranted);
        print('checkperrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr');
        print(_permissionReady);
  }

  Future<void> _loadAssets() async {
    print('checkperrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr22222');
        print(_permissionReady);
    if (_permissionReady) {
      openAppSettings();
      return;
    }

    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    List<Asset> resultList = <Asset>[];
    String error = 'No Error Dectected';

    const AlbumSetting albumSetting = AlbumSetting(
      fetchResults: {
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumUserLibrary,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumFavorites,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.album,
          subtype: PHAssetCollectionSubtype.albumRegular,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumSelfPortraits,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumPanoramas,
        ),
        PHFetchResult(
          type: PHAssetCollectionType.smartAlbum,
          subtype: PHAssetCollectionSubtype.smartAlbumVideos,
        ),
      },
    );
    const SelectionSetting selectionSetting = SelectionSetting(
      min: 0,
      max: 3,
      unselectOnReachingMax: true,
    );
    const DismissSetting dismissSetting = DismissSetting(
      enabled: true,
      allowSwipe: true,
    );
    final ThemeSetting themeSetting = ThemeSetting(
      backgroundColor: colorScheme.surface,
      selectionFillColor: colorScheme.primary,
      selectionStrokeColor: colorScheme.onPrimary,
      previewSubtitleAttributes: const TitleAttribute(fontSize: 12.0),
      previewTitleAttributes: TitleAttribute(
        foregroundColor: colorScheme.primary,
      ),
      albumTitleAttributes: TitleAttribute(
        foregroundColor: colorScheme.primary,
      ),
    );
    const ListSetting listSetting = ListSetting(
      spacing: 5.0,
      cellsPerRow: 4,
    );
    const AssetsSetting assetsSetting = AssetsSetting(
      // Set to allow pick videos.
      supportedMediaTypes: {MediaTypes.video, MediaTypes.image},
    );
    final CupertinoSettings iosSettings = CupertinoSettings(
      fetch: const FetchSetting(album: albumSetting, assets: assetsSetting),
      theme: themeSetting,
      selection: selectionSetting,
      dismiss: dismissSetting,
      list: listSetting,
    );

    try {
      resultList = await MultiImagePicker.pickImages(
        selectedAssets: images,
        // iosOptions: IOSOptions(
        //   doneButton:
        //       UIBarButtonItem(title: 'Confirm', tintColor: colorScheme.primary),
        //   cancelButton:
        //       UIBarButtonItem(title: 'Cancel', tintColor: colorScheme.primary),
        //   albumButtonColor: colorScheme.primary,
        //   settings: iosSettings,
        // ),
        androidOptions: AndroidOptions(
          actionBarColor: Colors.green,
          actionBarTitleColor: colorScheme.onSurface,
          statusBarColor: colorScheme.surface,
          actionBarTitle: "Select Photo",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: colorScheme.primary,
          hasCameraInPickerPage: true,
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      images = resultList;
      _error = error;
    });
  }

  @override
  void initState() {
    _requestPermissions();
    _lifecycleListener = AppLifecycleListener(
      onResume: _checkPermissions,
    );
    super.initState();
  }

  @override
  void dispose() {
    _lifecycleListener?.dispose();
    super.dispose();
  }

  Widget _buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        Asset asset = images[index];
        return AssetThumb(
          asset: asset,
          width: 300,
          height: 300,
        );
      }),
    );
  }

      // Function to handle post submission
    void _submitPost() {
      String postText = _postController.text.trim();
      
      if (postText.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Please write something or add an image")),
        );
        return;
      }

      // Here, you can send the post to a backend or save it in a local database
      print("Post Text: $postText");

      // Clear the fields after submission
      setState(() {
        _postController.clear();
      });

      // Go back to the previous screen
      Navigator.pop(context);
    }

     List<String> dropDownListitems = ['ddd','qqq','xxx','ccc'];
      final Rx<DateTime?> startDate = Rx<DateTime?>(null);
      final Rx<DateTime?> endDate = Rx<DateTime?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
          title: Text('Add Project'),
          actions: [
            TextButton(
              onPressed: _submitPost,
              child: Text(
                'Submit',
                style: TextStyle(color: Colors.green, fontSize: 18,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children:[
                   ///////////////////// Project Title //////////////////////
                  Text('Project Name:',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  CustomTextField(hintText: 'Project Name'),

                    /////////////////// Start Date //////////////////////
                    const SizedBox(height: 16,), 
                    const Text('Start Date:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      CustomDatePicker(label: 'Start Date', selectedDate: startDate),
                      const SizedBox(height: 16,),

                    ///////////////////// End Date //////////////////////
                    const SizedBox(height: 16,), 
                    const Text('End Date:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      CustomDatePicker(label: 'End Date', selectedDate: endDate),
                      const SizedBox(height: 16,), 
                      
                   ///////////////////// Project Description //////////////////////
                  const Text('Project Description:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10,), 
                  TextField(
                    controller: _postController,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                      hintText: "Talk about the Project...",
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                   /////////////////////  Skills used in this project //////////////////////
                  const Text('Skills:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10,),
                  TextField(
                    controller: _postController,
                    maxLines: 10,
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 2,color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                      hintText: "Skills Used In This Project...",
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                   ///////////////////// Project URL //////////////////////
                  const Text('Project URL',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                  CustomTextField(hintText: 'URL of website or Github'),
                  const SizedBox(height: 16),
            
              CustomButton(text: "Picks Project Photos",
                icon: Icons.image,
                iconColor: Colors.white,
                backgroundColor: Colors.green,
                width: MediaQuery.of(context).size.width,
                borderRadius: 10,
               onPressed: _loadAssets,),
              // Expanded(
              //   child: _buildGridView(),
              // ),
                  const SizedBox(height: 5),

              SizedBox(
                height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              child: _buildGridView(),),
              
            ],
                  ),
          ),
        ),
    );
  }
}