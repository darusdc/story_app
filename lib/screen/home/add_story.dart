import 'dart:io';

import 'package:dstory_app/common/styles.dart';
import 'package:dstory_app/model/story.dart';
import 'package:dstory_app/providers/picker_provider.dart';
import 'package:dstory_app/providers/story_provider.dart';
import 'package:dstory_app/widgets/location_dialog.dart';
import 'package:dstory_app/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';
import 'package:form_validator/form_validator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddStoryScreen extends StatelessWidget {
  const AddStoryScreen(
      {super.key, required this.onClickBack, required this.onClickUpdate});
  final Function() onClickBack;
  final Function() onClickUpdate;

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: androidBuilder,
      iosBuilder: iosBuilder,
      webBuilder: webBuilder,
    );
  }

  Widget iosBuilder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => PickerProvider(),
        child: CupertinoPageScaffold(child: _buildUI(context)));
  }

  Widget webBuilder(BuildContext context) {
    return _buildUI(context);
  }

  Widget androidBuilder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PickerProvider(),
      builder: (context, child) => Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.titleAddStory,
              overflow: TextOverflow.clip,
            ),
            leading: IconButton(
              onPressed: () {
                onClickBack();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
          body: SingleChildScrollView(child: _buildUI(context))),
    );
  }

  void _onGalleryClick(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final provider = context.read<PickerProvider>();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    final isMacOS = defaultTargetPlatform == TargetPlatform.macOS;
    final isLinux = defaultTargetPlatform == TargetPlatform.linux;
    if (isMacOS || isLinux) return;
    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }

  void _onCameraClick(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    final provider = context.read<PickerProvider>();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera);
    final isAndroid = defaultTargetPlatform == TargetPlatform.android;
    final isiOS = defaultTargetPlatform == TargetPlatform.iOS;
    final isNotMobile = !(isAndroid || isiOS);
    if (isNotMobile) return;

    if (pickedFile != null) {
      provider.setImageFile(pickedFile);
      provider.setImagePath(pickedFile.path);
    }
  }

  void _showLocationSelectionDialog(BuildContext context) async {
    final provider = context.read<PickerProvider>();
    final LatLng? selectedLocation = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return const LocationSelectionDialog();
      },
    );

    // Handle selected location
    if (selectedLocation != null) {
      provider.setLocation(selectedLocation);
    }
  }

  Widget _buildUI(BuildContext context) {
    bool isFree = FlavorConfig.instance.variables["isFree"];
    TextEditingController captions = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Consumer<PickerProvider>(
      builder: (context, value, child) {
        return Form(
          key: formKey,
          child: Column(
            children: [
              value.imageFilePath != null
                  ? Image.file(File(value.imageFilePath!))
                  : Image.asset('assets/images/tiger-3039280_1280.webp'),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(AppLocalizations.of(context)!.choicePhotoAddStory,
                    overflow: TextOverflow.clip),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () => _onGalleryClick(context),
                      icon: const Icon(Icons.folder_open)),
                  IconButton(
                      onPressed: () => _onCameraClick(context),
                      icon: const Icon(Icons.camera_alt)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(AppLocalizations.of(context)!.captionAddStory,
                        overflow: TextOverflow.clip),
                    TextFormField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: captions,
                      validator: ValidationBuilder()
                          .required(AppLocalizations.of(context)!
                              .captionValidatorAddStory)
                          .build(),
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: isFree
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content:
                              Text(AppLocalizations.of(context)!.appVerIssue),
                          duration: const Duration(seconds: 5),
                        ));
                      }
                    : () {
                        _showLocationSelectionDialog(
                            context); // Show the location selection dialog
                      },
                style: circleButton,
                icon: value.location != null
                    ? Text(value.locationLabel?.name ?? "Unknown location")
                    : Text(AppLocalizations.of(context)!.selectLocationText),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Consumer<StoryProvider>(
                  builder: (context, value, child) {
                    if (value.state == ResultState.loading) {
                      return const CircularProgressIndicator();
                    } else {
                      return ElevatedButton(
                        style: circleButton,
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            final picker = Provider.of<PickerProvider>(context,
                                listen: false);
                            if (picker.imageFilePath != null) {
                              SendStory response;
                              if (picker.location != null) {
                                response = await value.sendStory(
                                    captions.text, File(picker.imageFilePath!),
                                    lat: picker.location?.latitude,
                                    lon: picker.location?.longitude);
                              } else {
                                response = await value.sendStory(
                                  captions.text,
                                  File(picker.imageFilePath!),
                                );
                              }
                              if (response.error == false) {
                                // ignore: use_build_context_synchronously
                                await value.getNearMeStories(refresh: true);
                                // ignore: use_build_context_synchronously
                                await value.getAllStories(refresh: true);
                                onClickBack();
                              } else {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  // ignore: use_build_context_synchronously
                                  content: Text(AppLocalizations.of(context)!
                                      .noConnection),
                                  duration: const Duration(seconds: 5),
                                ));
                              }
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text(AppLocalizations.of(context)!
                                    .photoValidatorAddStory),
                                duration: const Duration(seconds: 5),
                              ));
                            }
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.upload),
                            Text(
                              AppLocalizations.of(context)!.submitAddStory,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(color: Colors.white),
                            )
                          ],
                        ),
                      );
                    }
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
