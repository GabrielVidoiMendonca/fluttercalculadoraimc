import '../components/bottom_button.dart';
import '../components/contador.dart';
import '../components/custom_card.dart';
import '../components/gender_content.dart';
import '../components/modal_result.dart';

import '../components/slider_altura.dart';

import 'package:flutter/material.dart';

enum Genero{ masculino, feminino}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  
  Genero? generoSelect;
  int altura = 120;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:GestureDetector(
                    onTap: (){
                      setState(() {
                      generoSelect = Genero.masculino;
                        
                      });
                    },
                  child: CustomCard(
                    active: generoSelect == Genero.masculino,
                    child: GenderContent(
                      icon: Icons.male,
                      label: 'Masculino',
                    ),
                  ),
                ),
                ),
                Expanded(
                  child:GestureDetector(
                    onTap: (){
                       setState(() {
                      generoSelect = Genero.feminino;
                      
                      });
                    },
                  child: CustomCard(
                    active: generoSelect == Genero.feminino,
                    child: GenderContent(
                      icon: Icons.female,
                      label: 'Feminino',
                    ),
                  ),
                ),
                ),
              ],
            ),
          ),
          Expanded(
            
            child:CustomCard(
            child: SliderAltura(
              altura: altura,
              onChanged: (double novaAltura){
                setState(() {
                altura = novaAltura.toInt();
                });
              },
            ),
            )
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child:CustomCard(
                  child: Contador(),
                  )
                ),
                Expanded(
                  child:CustomCard(
                  child: Contador(),
                  )
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: "Calcular IMC")
        ],
      ),
    );
  }
}
