import 'dart:io';
import 'package:calculator/app/modules/picture/data/repository/picture_repository.dart';
import 'package:calculator/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';




class ScanScreen extends StatefulWidget {
  @override
  _ScanScreenState createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  PictureRepository pictureRepository = PictureRepository();

  CameraController controller; 
  List<CameraDescription> cameras = []; 
  XFile capturedImage;
  List<XFile> capturedImagesList = [];
  String lastImagePath;

  @override
  void initState() {
    retrieveFromCache();
    super.initState();
    loadCameras();       
  }

  loadCameras() async {
    cameras = await availableCameras();
    if(cameras.length > 0){
      controller = CameraController(cameras[0], ResolutionPreset.max);
      controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
    }   
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  capturePicture() async {
    capturedImage = await controller.takePicture();
    addPictureToList(capturedImage);
    saveToCache();
    setState(() {});
  }

  addPictureToList(XFile image){
    capturedImagesList.add(image);
  }

  saveToCache() async {
    pictureRepository.saveResult(capturedImage);
    setState(() {
      lastImagePath = capturedImage.path;
    });
  }

  retrieveFromCache() async {
    lastImagePath = (await pictureRepository.retrieve()) ?? null;
    setState(() {});
  }

  getPictures(List<XFile> imageList) {
    final List<Widget> images = <Widget>[];

    for (int i = 0; i < imageList.length; i++) {
      images.add(new GridTile(
          child: new InkResponse(
        enableFeedback: true,
        child: new Image.file(File(imageList[i].path), fit: BoxFit.cover,),
        onTap: () => onImageTap(capturedImagesList[i].path),
      )));
    }

    return images;
  }

  onImageTap(String path) {
    Navigator.pushNamed(context, kScanDetailsRoute, arguments: path);
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(0.5),
        title: Text(
          "Scan factures",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: controller == null 
          ? Container() 
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                      child: CameraPreview(controller)),
                    OutlinedButton(
                      onPressed: capturePicture,                      
                      child: Text('capturer une image'),
                    ),
                    Text(
                      'Ma dernière facture',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,                        
                      ),
                      ),
                    lastImagePath == null
                    ? Container()
                    : Image.file(
                      File(lastImagePath), 
                      height: 150, 
                      width: 150,),
                    Text(
                      'Mes factures',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,                        
                      ),
                      ),
                    capturedImage == null
                    ? Container()
                    : GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        children: getPictures(capturedImagesList)
                    )
                  ],
                ),
              ),
            ),

    );
  }
}