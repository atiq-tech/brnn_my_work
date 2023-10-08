import 'package:device_info_plus/device_info_plus.dart';
import 'package:ecommerceshope/model/my_order_model/my_order_model.dart';
import 'package:ecommerceshope/utils/constant.dart';
import 'package:ecommerceshope/utils/save_pdf_file.dart';
import 'package:ecommerceshope/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_file/open_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class InvoicePage extends StatefulWidget {
  const InvoicePage({Key? key, required this.myOrderModel}) : super(key: key);

  final MyOrderModel myOrderModel;

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      body: Scaffold(
        appBar: AppBar(
          title: const Text("Sales Invoice",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          scrolledUnderElevation: 0,
        ),

        body: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Bornon Lifestyle Ltd.",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        SizedBox(height: 5,),
                        Text("Office: Flat # B4, House # 74, Road # 21, Banani, Dhaka Production House: Flat # 2C & 2D, House # 20, Shahid Minar Road, Kallayanpur, Dhaka.",
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500),
                        maxLines: 5,
                        overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("Invoice to.",style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                        const SizedBox(height: 5,),
                        SizedBox(
                          child: Text(
                            "Name: ${widget.myOrderModel.customerName}",
                            style: const TextStyle(fontSize: 12,
                            fontWeight: FontWeight.w500),
                            textAlign: TextAlign.end,
                            maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          child: Text("Phone: ${widget.myOrderModel.customerMobile}",
                            style: const TextStyle(fontSize: 12,
                                fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          child: Text("Billing Address: ${widget.myOrderModel.billingAddress}",
                            style: const TextStyle(fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(
                          child: Text("Shipping Address: ${widget.myOrderModel.shippingAddress}",
                            style: const TextStyle(fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.end,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        // Row(
                        //   children: [
                        //     const Text("Status:",style: TextStyle(fontSize: 12),),
                        //     const SizedBox(width: 10,),
                        //     Container(
                        //       padding:
                        //       const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                        //       decoration: BoxDecoration(
                        //         color: widget.orderModel.status == 'p'
                        //             ? Colors.orange.shade700
                        //             : widget.orderModel.status == 'o'
                        //             ? const Color(0xFF1B6AAA)
                        //             : widget.orderModel.status == 'h'
                        //             ? const Color(0xFf157347)
                        //             : widget.orderModel.status == 'd'
                        //             ? Colors.red.shade700
                        //             : null,
                        //         borderRadius: BorderRadius.circular(5),
                        //       ),
                        //       child: Text(
                        //         widget.orderModel.status == 'p'
                        //             ? "Pending"
                        //             : widget.orderModel.status == 'o'
                        //             ? "Ongoing"
                        //             : widget.orderModel.status == 'h'
                        //             ? "Received"
                        //             : widget.orderModel.status == 'd'
                        //             ? "Canceled"
                        //             : '',
                        //         style: const TextStyle(color: Colors.white, fontSize: 10),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10,),
              const Divider(),
              const SizedBox(height: 10,),

              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                          child: Text(
                            "SL.",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white,fontSize: 10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                          child: Text(
                            "P. Name",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white,fontSize: 10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                          child: Text(
                            "Color",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white,fontSize: 10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                          child: Text(
                            "Size",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white,fontSize: 10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                          child: Text(
                            "Qtn",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white,fontSize: 10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                          child: Text(
                            "U. Cost",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white,fontSize: 10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                          child: Text(
                            "W. Cost",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white,fontSize: 10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                          child: Text(
                            "T. Cost",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white,fontSize: 10),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 1,
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 3),
                      decoration: const BoxDecoration(
                        color: redColor,
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                          child: Text(
                            "Total",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.white,fontSize: 10),
                          )),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 10,),
              ...List.generate(widget.myOrderModel.orderDetails.length, (index){
                return Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: SizedBox(
                            child: Text(
                              "${index+1}",
                              maxLines: 1,
                              // style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 10),
                            ),
                        ),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                          child: Text(
                            widget.myOrderModel.orderDetails[index].productName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 10),
                            textAlign: TextAlign.center,
                          )),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                          child: Text(
                            "${widget.myOrderModel.orderDetails[index].colorId}",
                            maxLines: 1,
                            style: const TextStyle(fontSize: 10),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                          child: Text(
                            "${widget.myOrderModel.orderDetails[index].sizeId}",
                            maxLines: 1,
                            style: const TextStyle(fontSize: 10),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                          child: Text(
                            "${widget.myOrderModel.orderDetails[index].quantity}",
                            maxLines: 1,
                            style: const TextStyle(fontSize: 10),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          )),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                          child: Text(
                            widget.myOrderModel.orderDetails[index].price,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 10),

                          )),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                          child: Text(
                            "${widget.myOrderModel.orderDetails[index].wpPrice}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 10),

                          )),
                    ),
                    const SizedBox(
                      width: 1,
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                          child: Text(
                            "${widget.myOrderModel.orderDetails[index].wpPrice}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 10),
                          )),
                    ),
                    const SizedBox(
                      width: 1
                    ),
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                          child: Text(
                            "${widget.myOrderModel.orderDetails[index].totalPrice}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 10),
                          )),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20,),

              Align(
                alignment: Alignment.centerRight,
                child: Text("Subtotal: ৳${widget.myOrderModel.totalAmount}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("Shipping: ৳${widget.myOrderModel.shippingCost}",
                  style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Text("Total: ৳${widget.myOrderModel.totalAmount}",
                  style: const TextStyle(fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),),
              ),
              const SizedBox(height: 30,),

              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: TextButton.icon(
              //     onPressed: () async {
              //       final iconImage = (await rootBundle.load('img/bornon_logo.png')).buffer.asUint8List();
              //       // _createPDF(
              //       //     filename: '${widget.orderModel.invoice}',
              //       //     context: context, index: widget.index,
              //       //     dataLength: state.orderDetailsModel.length,
              //       //     data: state.orderDetailsModel,
              //       // );
              //       DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
              //       final androidInfo = await deviceInfoPlugin.androidInfo;
              //       apiLevel = androidInfo.version.sdkInt;
              //       PermissionStatus storagePermission;
              //       print("apiLevel $apiLevel");
              //
              //       if (apiLevel >= 31){
              //         storagePermission = await Permission.manageExternalStorage.request();
              //       } else {
              //         storagePermission = await Permission.storage.request();
              //       }
              //
              //       if (storagePermission == PermissionStatus.granted) {
              //         try {
              //           pdf.addPage(
              //             pw.MultiPage(
              //               pageFormat: PdfPageFormat.a4,
              //               header: (context) {
              //                 return pw.Column(
              //                     children: [
              //                       pw.Row(
              //                         mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              //                         children: [
              //                           pw.Image(
              //                             pw.MemoryImage(iconImage),
              //                             height: 300,
              //                             width: 150,
              //                           ),
              //                           pw.SizedBox(width: 5 * PdfPageFormat.mm),
              //                           pw.Text(
              //                             'Invoice   #${widget.myOrderModel.invoiceNo}',
              //                             style: pw.TextStyle(
              //                               fontSize: 20.0,
              //                               fontWeight: pw.FontWeight.bold,
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                       pw.SizedBox(height: 5 * PdfPageFormat.mm),
              //                       pw.Padding(
              //                           padding: pw.EdgeInsets.zero,
              //                           child: pw.Divider()
              //                       ),
              //                       pw.Padding(
              //                           padding: pw.EdgeInsets.zero,
              //                           child: pw.Divider()
              //                       ),
              //                       pw.SizedBox(height: 5 * PdfPageFormat.mm),
              //                     ]
              //                 );
              //               },
              //               build: (context) {
              //                 return [
              //
              //                   pw.Align(
              //                       child: pw.Text("Order Invoice",style: pw.TextStyle(
              //                           fontSize: 15,
              //                           fontWeight: pw.FontWeight.bold
              //                       )),
              //                       alignment: pw.Alignment.center
              //                   ),
              //
              //                   pw.SizedBox(height: 10 * PdfPageFormat.mm),
              //
              //                   pw.Row(
              //                     crossAxisAlignment: pw.CrossAxisAlignment.start,
              //                     children: [
              //                       pw.SizedBox(width: 1 * PdfPageFormat.mm),
              //                       pw.Expanded(
              //                         child: pw.Column(
              //                           mainAxisSize: pw.MainAxisSize.min,
              //                           crossAxisAlignment: pw.CrossAxisAlignment.start,
              //                           children: [
              //                             pw.Text(
              //                               'Office: Flat # B4, House # 74, Road # 21, Banani, Dhaka Production House: Flat # 2C & 2D, House # 20, Shahid Minar Road, Kallayanpur, Dhaka',
              //                               style: pw.TextStyle(
              //                                   color: PdfColors.black,
              //                                   fontWeight: pw.FontWeight.bold),
              //                               maxLines: 5,
              //                             ),
              //                             pw.SizedBox(height: 10),
              //                           ],
              //                         ),
              //                       ),
              //                       pw.Spacer(),
              //                       pw.Expanded(child: pw.Column(
              //                         mainAxisSize: pw.MainAxisSize.min,
              //                         crossAxisAlignment: pw.CrossAxisAlignment.start,
              //                         children: [
              //                           pw.Text(
              //                             'Name : ${widget.myOrderModel.customerName}',
              //                             style: pw.TextStyle(
              //                               fontWeight: pw.FontWeight.bold,
              //                             ),
              //                           ),
              //                           pw.SizedBox(height: 5),
              //                           pw.Text(
              //                             'Phone : ${widget.myOrderModel.customerMobile}',
              //                             style: pw.TextStyle(
              //                               fontWeight: pw.FontWeight.bold,
              //                             ),
              //                           ),
              //                           pw.SizedBox(height: 5),
              //                           pw.Text(
              //                             'Billing Address : ${widget.myOrderModel.billingAddress}',
              //                             style: pw.TextStyle(
              //                               fontWeight: pw.FontWeight.bold,
              //                             ),
              //                           ),
              //                           pw.SizedBox(height: 5),
              //                           pw.Text(
              //                             'Shipping Address : ${widget.myOrderModel.shippingAddress}',
              //                             style: pw.TextStyle(
              //                               fontWeight: pw.FontWeight.bold,
              //                             ),
              //                           ),
              //                         ],
              //                       ),),
              //                     ],
              //                   ),
              //                   pw.SizedBox(height: 5 * PdfPageFormat.mm),
              //
              //                   pw.Divider(),
              //
              //                   pw.SizedBox(height: 5 * PdfPageFormat.mm),
              //
              //                   pw.Row(
              //                     children: [
              //                       pw.Expanded(
              //                         flex: 1,
              //                         child: pw.Container(
              //                           padding: const pw.EdgeInsets.symmetric(
              //                               horizontal: 5, vertical: 3),
              //                           decoration: const pw.BoxDecoration(
              //                             color: PdfColor.fromInt(0xFFf27319),
              //                           ),
              //                           alignment: pw.Alignment.center,
              //                           child: pw.SizedBox(
              //                               child: pw.Text(
              //                                 "SL.",
              //                                 maxLines: 1,
              //                                 // overflow: pw.TextOverflow.,
              //                                 style: const pw.TextStyle(color: PdfColors.white,fontSize: 10),
              //                               )),
              //                         ),
              //                       ),
              //                       pw.SizedBox(
              //                         width: 1,
              //                       ),
              //                       pw.Expanded(
              //                         flex: 3,
              //                         child: pw.Container(
              //                           padding: const pw.EdgeInsets.symmetric(
              //                               horizontal: 5, vertical: 3),
              //                           decoration: const pw.BoxDecoration(
              //                             color: PdfColor.fromInt(0xFFf27319),
              //                           ),
              //                           alignment: pw.Alignment.center,
              //                           child: pw.SizedBox(
              //                               child: pw.Text(
              //                                 "P.Name",
              //                                 maxLines: 1,
              //                                 // overflow: pw.TextOverflow.ellipsis,
              //                                 style: const pw.TextStyle(color: PdfColors.white,fontSize: 10),
              //                               )),
              //                         ),
              //                       ),
              //                       pw.SizedBox(
              //                         width: 1,
              //                       ),
              //                       pw.Expanded(
              //                         flex: 2,
              //                         child: pw.Container(
              //                           padding: const pw.EdgeInsets.symmetric(
              //                               horizontal: 5, vertical: 3),
              //                           decoration: const pw.BoxDecoration(
              //                             color: PdfColor.fromInt(0xFFf27319),
              //                           ),
              //                           alignment: pw.Alignment.center,
              //                           child: pw.SizedBox(
              //                               child: pw.Text(
              //                                 "Color",
              //                                 maxLines: 1,
              //                                 // overflow: pw.TextOverflow.ellipsis,
              //                                 style: const pw.TextStyle(color: PdfColors.white,fontSize: 10),
              //                               )),
              //                         ),
              //                       ),
              //                       pw.SizedBox(
              //                         width: 1,
              //                       ),
              //                       pw.Expanded(
              //                         flex: 2,
              //                         child: pw.Container(
              //                           padding: const pw.EdgeInsets.symmetric(
              //                               horizontal: 5, vertical: 3),
              //                           decoration: const pw.BoxDecoration(
              //                             color: PdfColor.fromInt(0xFFf27319),
              //                           ),
              //                           alignment: pw.Alignment.center,
              //                           child: pw.SizedBox(
              //                               child: pw.Text(
              //                                 "Size",
              //                                 maxLines: 1,
              //                                 // overflow: pw.TextOverflow.ellipsis,
              //                                 style: const pw.TextStyle(color: PdfColors.white,fontSize: 10),
              //                               )),
              //                         ),
              //                       ),
              //                       pw.SizedBox(
              //                         width: 1,
              //                       ),
              //                       pw.Expanded(
              //                         flex: 1,
              //                         child: pw.Container(
              //                           padding: const pw.EdgeInsets.symmetric(
              //                               horizontal: 5, vertical: 3),
              //                           decoration: const pw.BoxDecoration(
              //                             color: PdfColor.fromInt(0xFFf27319),
              //                           ),
              //                           alignment: pw.Alignment.center,
              //                           child: pw.SizedBox(
              //                               child: pw.Text(
              //                                 "Qtn",
              //                                 maxLines: 1,
              //                                 // overflow: pw.TextOverflow.ellipsis,
              //                                 style: const pw.TextStyle(color: PdfColors.white,fontSize: 10),
              //                               )),
              //                         ),
              //                       ),
              //                       pw.SizedBox(
              //                         width: 1,
              //                       ),
              //                       pw.Expanded(
              //                         flex: 2,
              //                         child: pw.Container(
              //                           padding: const pw.EdgeInsets.symmetric(
              //                               horizontal: 5, vertical: 3),
              //                           decoration: const pw.BoxDecoration(
              //                             color: PdfColor.fromInt(0xFFf27319),
              //                           ),
              //                           alignment: pw.Alignment.center,
              //                           child: pw.SizedBox(
              //                               child: pw.Text(
              //                                 "U. Cost",
              //                                 maxLines: 1,
              //                                 // overflow: pw.TextOverflow.ellipsis,
              //                                 style: const pw.TextStyle(color: PdfColors.white,fontSize: 10),
              //                               )),
              //                         ),
              //                       ),
              //
              //                       pw.SizedBox(
              //                         width: 1,
              //                       ),
              //                       pw.Expanded(
              //                         flex: 2,
              //                         child: pw.Container(
              //                           padding: const pw.EdgeInsets.symmetric(
              //                               horizontal: 5, vertical: 3),
              //                           decoration: const pw.BoxDecoration(
              //                             color: PdfColor.fromInt(0xFFf27319),
              //                           ),
              //                           alignment: pw.Alignment.center,
              //                           child: pw.SizedBox(
              //                               child: pw.Text(
              //                                 "W. Cost",
              //                                 maxLines: 1,
              //                                 // overflow: pw.TextOverflow.ellipsis,
              //                                 style: const pw.TextStyle(color: PdfColors.white,fontSize: 10),
              //                               )),
              //                         ),
              //                       ),
              //
              //                       pw.SizedBox(
              //                         width: 1,
              //                       ),
              //                       pw.Expanded(
              //                         flex: 2,
              //                         child: pw.Container(
              //                           padding: const pw.EdgeInsets.symmetric(
              //                               horizontal: 5, vertical: 3),
              //                           decoration: const pw.BoxDecoration(
              //                             color: PdfColor.fromInt(0xFFf27319),
              //                           ),
              //                           alignment: pw.Alignment.center,
              //                           child: pw.SizedBox(
              //                               child: pw.Text(
              //                                 "T. Cost",
              //                                 maxLines: 1,
              //                                 // overflow: pw.TextOverflow.ellipsis,
              //                                 style: const pw.TextStyle(color: PdfColors.white,fontSize: 10),
              //                               )),
              //                         ),
              //                       ),
              //
              //                       pw.SizedBox(
              //                         width: 1,
              //                       ),
              //                       pw.Expanded(
              //                         flex: 2,
              //                         child: pw.Container(
              //                           padding: const pw.EdgeInsets.symmetric(
              //                               horizontal: 5, vertical: 3),
              //                           decoration: const pw.BoxDecoration(
              //                             color: PdfColor.fromInt(0xFFf27319),
              //                           ),
              //                           alignment: pw.Alignment.center,
              //                           child: pw.SizedBox(
              //                               child: pw.Text(
              //                                 "Total",
              //                                 maxLines: 1,
              //                                 // overflow: pw.TextOverflow.ellipsis,
              //                                 style: const pw.TextStyle(color: PdfColors.white,fontSize: 10),
              //                               )),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //
              //                   pw.SizedBox(height: 10),
              //
              //                   ...List.generate(widget.myOrderModel.orderDetails.length, (index){
              //                     return pw.Container(
              //                       padding: const pw.EdgeInsets.symmetric(vertical: 3),
              //                       child: pw.Row(
              //                         children: [
              //                           pw.Expanded(
              //                               flex: 1,
              //                               child: pw.Center(
              //                                 child: pw.SizedBox(
              //                                     child: pw.Text(
              //                                       "${index+1}",
              //                                       maxLines: 2,
              //                                       // style: TextStyle(fontSize: 12),
              //                                       // overflow: pw.TextOverflow.ellipsis,
              //                                       textAlign: pw.TextAlign.center,
              //                                       // style:  pw.TextStyle(fontSize: 10),
              //                                     ),
              //                                 ),
              //                               )
              //                           ),
              //                           pw.SizedBox(
              //                             width: 2,
              //                           ),
              //                           pw.Expanded(
              //                             flex: 3,
              //                             child: pw.Center(
              //                               child:  pw.SizedBox(
              //                                   child: pw.Text(
              //                                     widget.myOrderModel.orderDetails[index].productName,
              //                                     maxLines: 1,
              //                                     // overflow: pw.TextOverflow.ellipsis,
              //                                     // style: pw.TextStyle(fontSize: 10),
              //                                     textAlign: pw.TextAlign.center,
              //                                   )),
              //                             )
              //                           ),
              //                           pw.SizedBox(
              //                             width: 2,
              //                           ),
              //                           pw.Expanded(
              //                             flex: 2,
              //                             child: pw.Center(
              //                               child: pw.SizedBox(
              //                                   child:  pw.Text(
              //                                     '${widget.myOrderModel.orderDetails[index].colorId}',
              //                                     maxLines: 1,
              //                                     // style: pw.TextStyle(fontSize: 10),
              //                                     // overflow: TextOverflow.ellipsis,
              //                                     textAlign: pw.TextAlign.center,
              //                                   )),
              //                             )
              //                           ),
              //                           pw.SizedBox(
              //                             width: 2,
              //                           ),
              //                           pw.Expanded(
              //                             flex: 2,
              //                             child: pw.Center(
              //                               child: pw.SizedBox(
              //                                   child: pw.Text(
              //                                     '${widget.myOrderModel.orderDetails[index].sizeId}',
              //                                     maxLines: 1,
              //                                     // overflow: TextOverflow.ellipsis,
              //                                     textAlign: pw.TextAlign.center,
              //                                     // style: const TextStyle(fontSize: 10),
              //
              //                                   )),
              //                             )
              //                           ),
              //                           pw.SizedBox(
              //                             width: 2,
              //                           ),
              //                           pw.Expanded(
              //                             flex: 1,
              //                             child: pw.Center(
              //                               child:  pw.SizedBox(
              //                                   child: pw.Text(
              //                                     '${widget.myOrderModel.orderDetails[index].quantity}',
              //                                     maxLines: 1,
              //                                     // overflow: TextOverflow.ellipsis,
              //                                     textAlign: pw.TextAlign.center,
              //                                     // style: const TextStyle(fontSize: 10),
              //
              //                                   )),
              //                             )
              //                           ),
              //                           pw.SizedBox(
              //                             width: 2,
              //                           ),
              //                           pw.Expanded(
              //                             flex: 2,
              //                             child: pw.Center(
              //                               child: pw.SizedBox(
              //                                   child: pw.Text(
              //                                     '${widget.myOrderModel.orderDetails[index].price}',
              //                                     maxLines: 1,
              //                                     // overflow: TextOverflow.ellipsis,
              //                                     textAlign: pw.TextAlign.center,
              //                                     style: const pw.TextStyle(fontSize: 10),
              //                                   )),
              //                             )
              //                           ),
              //                           pw.SizedBox(
              //                             width: 2,
              //                           ),
              //                           pw.Expanded(
              //                             flex: 2,
              //                             child: pw.Center(
              //                               child: pw.SizedBox(
              //                                 child: pw.Text(
              //                                   '${widget.myOrderModel.orderDetails[index].wpPrice}',
              //                                   maxLines: 1,
              //                                   // overflow: TextOverflow.ellipsis,
              //                                   textAlign: pw.TextAlign.center,
              //                                   style: const pw.TextStyle(fontSize: 10),
              //                                 ),
              //                               ),
              //                             )
              //                           ),
              //
              //                           pw.SizedBox(
              //                             width: 2,
              //                           ),
              //                           pw.Expanded(
              //                             flex: 2,
              //                             child: pw.Center(
              //                               child: pw.SizedBox(
              //                                   child: pw.Text(
              //                                     '${widget.myOrderModel.orderDetails[index].wpPrice}',
              //                                     textAlign: pw.TextAlign.center,
              //                                     style: const pw.TextStyle(fontSize: 10),
              //                                   ),
              //                               ),
              //                             )
              //                           ),
              //
              //                           pw.SizedBox(
              //                             width: 2,
              //                           ),
              //                           pw.Expanded(
              //                             flex: 2,
              //                             child: pw.SizedBox(
              //                                 child: pw.Text(
              //                                   '${widget.myOrderModel.orderDetails[index].totalPrice}',
              //                                   maxLines: 1,
              //                                   // overflow: TextOverflow.ellipsis,
              //                                   textAlign: pw.TextAlign.center,
              //                                   style: const pw.TextStyle(fontSize: 10),
              //                                 )),
              //                           ),
              //                         ],
              //                       ),
              //                     );
              //                   }),
              //
              //                   pw.SizedBox(height: 10 * PdfPageFormat.mm),
              //
              //                   pw.Row(
              //                     mainAxisAlignment: pw.MainAxisAlignment.end,
              //                     children: [
              //                       pw.Text("Subtotal: ${widget.myOrderModel.totalAmount}",
              //                           style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              //                     ]
              //                   ),
              //                   pw.SizedBox(height: 5),
              //                   pw.Row(
              //                     mainAxisAlignment: pw.MainAxisAlignment.end,
              //                     children: [
              //                       pw.Text("Shipping: ${widget.myOrderModel.shippingCost}",
              //                           style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              //                     ]
              //                   ),
              //                   pw.SizedBox(height: 5),
              //                   pw.Row(
              //                     mainAxisAlignment: pw.MainAxisAlignment.end,
              //                     children: [
              //                       pw.Text("Total: ${widget.myOrderModel.totalAmount}",
              //                           style: pw.TextStyle(fontWeight: pw.FontWeight.bold, fontSize: 20)),
              //                     ]
              //                   ),
              //
              //                   pw.SizedBox(height: 30),
              //
              //                 ];
              //               },
              //               footer: (context) {
              //                 return pw.Row(
              //                     mainAxisAlignment: pw.MainAxisAlignment.start,
              //                     children: [
              //                       pw.Text(
              //                           "Developed by: : Link-Up Technologoy"
              //                               "\nContact no: 01911978897"
              //                       ),
              //                     ]
              //                 );
              //               },
              //             ),
              //           );
              //
              //           final bytes = await pdf.save();
              //
              //           SaveFile.saveAndLaunchFile(bytes, '${widget.myOrderModel.invoiceNo}.pdf', apiLevel, context);
              //
              //         } catch (e) {
              //           print("Error+++++++ $e ");
              //
              //           apiLevel >= 33 ? ScaffoldMessenger.of(context).showSnackBar(
              //             const SnackBar(
              //               content: Text("Already saved in your device"),
              //             ),
              //           ): ScaffoldMessenger.of(context).showSnackBar(
              //             SnackBar(
              //               content: const Text("Already saved in your device"),
              //               action: SnackBarAction(
              //                 label: "Open",
              //                 onPressed: () {
              //                   OpenFile.open('/storage/emulated/0/Download/${widget.myOrderModel.invoiceNo}.pdf');
              //                 },
              //               ),
              //             ),
              //           );
              //           //   print("Saved already");
              //         }
              //       }
              //       else if (storagePermission.isDenied) {
              //         Utils.toastMsg("Required Storage Permission");
              //         openAppSettings();
              //       } else if (storagePermission.isPermanentlyDenied) {
              //         await openAppSettings();
              //         // _createPDF();
              //       }
              //     },
              //     label: const Text('Save as PDF'), icon: const Icon(Icons.download),
              //     style: TextButton.styleFrom(
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(10),
              //         side: BorderSide(
              //           color: redColor,
              //         ),
              //       ),
              //       padding: EdgeInsets.symmetric(horizontal: 5),
              //
              //     ),
              //   ),
              // ),

            ],
          ),
        ),
      ),
    );
  }
  var apiLevel;
  final pdf = pw.Document();

}

class CustomTextStyle {
  TextStyle customtextStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 15,
  );
}

class CustomButtonTextStyle {
  TextStyle custombuttontextStyle = const TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    color: Colors.black54
  );
}
