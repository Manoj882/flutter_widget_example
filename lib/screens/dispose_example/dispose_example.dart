import 'package:flutter/material.dart';

class DisposeExample extends StatefulWidget {
  const DisposeExample({super.key});

  @override
  State<DisposeExample> createState() => _DisposeExampleState();
}

class _DisposeExampleState extends State<DisposeExample> {
  String email = "";
  String orgEmail = "";

  final _personalFormKey = GlobalKey<FormState>();
  final _orgFormKey = GlobalKey<FormState>();

  bool _isPersonal = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dispose Exammple'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // PersonalForm(email: email, personalFormKey: _personalFormKey,),
                  // OrganizationForm(orgEmail: orgEmail, orgFormKey: _orgFormKey,),

                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isPersonal = true;
                      });
                    },
                    child: const Text("Personal"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _isPersonal = false;
                      });
                    },
                    child: const Text("Organization"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              if (_isPersonal)
                PersonalForm(email: email, personalFormKey: _personalFormKey),
              if (!_isPersonal)
                OrganizationForm(orgEmail: orgEmail, orgFormKey: _orgFormKey),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton(
  onPressed: () async{
    if (_personalFormKey.currentState?.validate() == true || _orgFormKey.currentState?.validate() == true) {

      bool iSuccess = false;

    iSuccess =  await Future.delayed(const Duration(seconds: 2), (){
        return true;
      });

      if(iSuccess){
         _personalFormKey.currentState?.reset();
                  _orgFormKey.currentState?.reset();
          showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Confirmation'),
            content: const Text('Are you sure you want to reset the forms?'),
            actions: [
              TextButton(
                onPressed: () {
                  // Close the dialog
                  Navigator.of(context).pop();
                },
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  // Reset the forms and close the dialog
                  // _personalFormKey.currentState?.reset();
                  // _orgFormKey.currentState?.reset();
                  Navigator.of(context).pop();
                },
                child: const Text('Yes'),
              ),
            ],
          );
        },
      );
   

      }
    
    }
  },
  child: const Text('Submit'),
),

            ],
          ),
        ),
      ),
    );
  }
}

class PersonalForm extends StatefulWidget {
  const PersonalForm(
      {required this.email, required this.personalFormKey, super.key});

  final String email;
  final GlobalKey<FormState> personalFormKey;

  @override
  State<PersonalForm> createState() => _PersonalFormState();
}

class _PersonalFormState extends State<PersonalForm> {
  final emailController = TextEditingController();

  GlobalKey<FormState> _personalFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailController.text = widget.email;
    _personalFormKey = widget.personalFormKey;
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Form(
        key: _personalFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              validator: (val){
                if(val?.isEmpty == true){
                  return "Cannot be empty";

                }
                return null;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class OrganizationForm extends StatefulWidget {
  const OrganizationForm(
      {required this.orgEmail, required this.orgFormKey, super.key});

  final String orgEmail;
  final GlobalKey<FormState> orgFormKey;

  @override
  State<OrganizationForm> createState() => _OrganizationFormState();
}

class _OrganizationFormState extends State<OrganizationForm> {
  final _orgEmailController = TextEditingController();

  GlobalKey<FormState> _orgFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _orgEmailController.text = widget.orgEmail;
    _orgFormKey = widget.orgFormKey;
  }

  @override
  void dispose() {
    _orgEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      child: Form(
        key: _orgFormKey,
        child: Column(
          children: [
            TextFormField(
              controller: _orgEmailController,
            ),
          ],
        ),
      ),
    );
  }
}
