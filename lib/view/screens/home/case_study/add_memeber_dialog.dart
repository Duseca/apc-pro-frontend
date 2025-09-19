import 'package:apc_pro/view/widgets/custom_dropdown.dart';
import 'package:apc_pro/view/widgets/dialogboxes.dart';
import 'package:apc_pro/view/widgets/my_button.dart';
import 'package:apc_pro/view/widgets/my_text_field.dart';
import 'package:flutter/material.dart';

class AddMemeberDialog extends StatelessWidget {
  const AddMemeberDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return dialogBoxBody(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyTextField(
            label: 'Name',
            hint:
                'Provide a comprehensive description of the project, including scope, objectives, and key deliverables...',
            marginBottom: 20,
            maxLines: 2,
          ),
          MyTextField(
            label: 'Role',
            hint:
                'Describe your specific role, responsibilities, and level of authority on this project...',
            marginBottom: 20,
            maxLines: 2,
          ),
          MyTextField(
            label: 'Organization',
            hint:
                'Detail the specific scope of work you were responsible for...',
            marginBottom: 20,
            maxLines: 2,
          ),
          CustomDropdown2(
            label: 'Reporting Relationship',
            hint: 'Peer/ Colleague',
            items: ['Peer/ Colleague', 'outsiders'],
            value: 'Peer/ Colleague',
            onChanged: (t) {},
            hasInfo: false,
          ),
          MyButton(
            mTop: 30,
            buttonText: 'Add',
            mBottom: 20,
          )
        ],
      ),
    );
  }
}
