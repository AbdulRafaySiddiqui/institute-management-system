// import 'package:Client/models/BranchModel.dart';
// import 'package:Client/viewmodels/BranchViewModel.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class BranchForm extends StatelessWidget {
//   BranchForm({Key key, this.isUpdateForm = false}) : super(key: key);
//   final bool isUpdateForm;
//   final _form = GlobalKey<FormState>();
//   final _nameController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     BranchModel model = isUpdateForm
//         ? Provider.of<BranchViewModel>(context).selectedBranch
//         : BranchModel();
//     _nameController.text = model?.name;
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: model == null
//             ? Center(
//                 child: Text("Select a branch to edit."),
//               )
//             : Form(
//                 autovalidateMode: AutovalidateMode.onUserInteraction,
//                 key: _form,
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         isUpdateForm ? 'Edit' : 'Add',
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 20,
//                             color: Theme.of(context).primaryColor),
//                       ),
//                     ),
//                     Divider(),
//                     TextFormField(
//                       controller: _nameController,
//                       decoration: InputDecoration(labelText: 'Branch Name'),
//                       validator: (value) =>
//                           value.isEmpty ? "Name cannot be empty." : null,
//                       onSaved: (value) => model.name = value,
//                     ),
//                     SizedBox(height: 20),
//                     Align(
//                       alignment: Alignment.bottomRight,
//                       child: Consumer<BranchViewModel>(
//                         builder: (context, value, child) => (!isUpdateForm &&
//                                     value.isAdding) ||
//                                 (isUpdateForm && value.isUpdating)
//                             ? SizedBox(
//                                 height: 20,
//                                 width: 20,
//                                 child: CircularProgressIndicator())
//                             : RaisedButton(
//                                 onPressed: () async {
//                                   if (!_form.currentState.validate()) return;
//                                   _form.currentState.save();

//                                   if (isUpdateForm)
//                                     await Provider.of<BranchViewModel>(context,
//                                             listen: false)
//                                         .update(model);
//                                   else {
//                                     await Provider.of<BranchViewModel>(context,
//                                             listen: false)
//                                         .add(model);
//                                     model = BranchModel();
//                                   }
//                                   _form.currentState.reset();
//                                 },
//                                 child: Text(isUpdateForm ? 'Update' : 'Add'),
//                               ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
// }
