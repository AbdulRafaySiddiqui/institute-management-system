import 'dart:html';
import 'dart:typed_data';

import 'package:Client/service/DialogService/DialogService.dart';
import 'package:Client/views/widgets/Buttons/PrimaryButton.dart';
import 'package:flutter/material.dart';

class ImagePicker extends StatefulWidget {
  final Function(Uint8List) onImageSelect;
  final String buttonText;
  const ImagePicker(
      {Key key, this.onImageSelect, this.buttonText = "Select Image"})
      : super(key: key);
  @override
  _ImagePickerState createState() => _ImagePickerState();
}

class _ImagePickerState extends State<ImagePicker> {
  Uint8List imageBytes;
  bool isBusy = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          //Image
          if (imageBytes != null)
            Image.memory(
              imageBytes,
              height: 100,
            ),
          SizedBox(
            height: 10,
          ),
          //Image Button
          PrimaryButton(
            isBusy: isBusy,
            outlined: true,
            onPressed: () async {
              try {
                //NOTE: Following code uses FilePicker package.
                // var result =
                //     await FilePicker.platform.pickFiles(type: FileType.image);

                // if (result != null) {
                //   imageBytes = result.files.single.bytes;
                //   widget.onImageSelect(result.files.single.bytes);
                // }

                setState(() {
                  isBusy = true;
                });

                InputElement uploadInput = FileUploadInputElement();
                uploadInput.click();

                uploadInput.onChange.listen((e) {
                  // read file content as dataURL
                  final files = uploadInput.files;
                  if (files.length == 1) {
                    final file = files[0];
                    FileReader reader = FileReader();

                    reader.onLoadEnd.listen((e) {
                      imageBytes = reader.result;
                      widget.onImageSelect(reader.result);
                      setState(() {
                        isBusy = false;
                      });
                    });

                    reader.onAbort.listen((event) {
                      setState(() => isBusy = false);
                    });

                    reader.onError.listen((fileEvent) {
                      DialogService.showErrorDialog(
                          message: "Failed to pick file");
                      setState(() {
                        isBusy = false;
                      });
                    });

                    reader.readAsArrayBuffer(file);
                  }
                });
              } catch (e) {
                setState(() {
                  isBusy = false;
                });
                DialogService.showErrorDialog(message: e);
              }
            },
            text: widget.buttonText,
          ),
        ],
      ),
    );
  }
}
