import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:tasky_app/Core/helpers/extensions.dart';
import 'package:tasky_app/Core/helpers/utils_functions.dart';
import 'package:tasky_app/Core/networking/api_error_handler.dart';
import 'package:tasky_app/Core/routing/app_router.dart';
import 'package:tasky_app/Core/routing/routes.dart';
import 'package:tasky_app/features/task_details/data/task_details_repo.dart';

class BarcodeScanScreen extends StatefulWidget {
  const BarcodeScanScreen({super.key});

  @override
  State<BarcodeScanScreen> createState() => _BarcodeScanScreenState();
}

class _BarcodeScanScreenState extends State<BarcodeScanScreen> {
  Barcode? _barcode;
  MobileScannerController? _cameraController;

  @override
  void initState() {
    super.initState();

    _cameraController = MobileScannerController();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  void _handleBarcode(BarcodeCapture barcodes) async {
    if (mounted) {
      setState(() {
        _barcode = barcodes.barcodes.firstOrNull;
      });
      _cameraController?.stop();
      final response = await GetIt.instance<TaskDetailsRepo>()
          .getTodoById(_barcode?.displayValue ?? '');
      response.when(
        success: (data) {
          context.pushReplacementNamed(Routes.taskDetails,
              arguments: TaskDetailsScreenArgs(
                  taskImage: data.image!,
                  taskTitle: data.title!,
                  id: data.id!,
                  taskDesc: data.desc!,
                  priority: data.priority!,
                  status: data.status!));
        },
        failure: (ErrorHandler errorHandler) {
          setupErrorState(context, errorHandler.apiErrorModel.message!);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Task QR Code')),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: _cameraController,
            onDetect: _handleBarcode,
          ),
        ],
      ),
    );
  }
}
