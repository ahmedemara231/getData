import 'package:flutter/material.dart';
import 'package:untitled6/Login_api/Repo.dart';
import 'package:untitled6/Login_api/loginModel.dart';
import 'package:untitled6/View/news_screen.dart';

class Login extends StatelessWidget {
   Login({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>(); // ال key دة بعطيه للفورم عشان اعمل للفورم access
  var emailCont = TextEditingController();
  var passCont = TextEditingController();

   Repository repository = Repository();
   late LoginModel loginModel;
   Future<void> login()async
   {
      await repository.login(
         email: emailCont.text,
         password: passCont.text,
     ).then((value)
     {
       loginModel = value;
     },
     );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailCont,
                validator: (email)
                {
                  if(email!.isEmpty)
                    {
                      return 'This Field is required';
                    }
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'E-mail',
                    labelText: 'E-mail',
                    border: OutlineInputBorder()
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passCont,
                validator: (pass)
                {
                  if(pass!.isEmpty)
                  {
                    return 'This Field is required';
                  }
                },
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    hintText: 'password',
                    labelText: 'password',
                    border: OutlineInputBorder()
                ),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(15)
                  )
                ),
                  onPressed: ()async
                  {
                    if(formKey.currentState!.validate())
                    {
                      await login().then((value)
                        {
                          if(loginModel.status == true)
                          {
                            print(loginModel.message);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const News(),
                                )
                            );
                          }
                        },
                      );
                     }
                    else
                    {
                      print('not validate');
                    }
                    },
                  child: const Text(
                    'LOGIN',
                    style: TextStyle(
                        color: Colors.white
                    ),
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
