//
//  ExerciseUIView.swift
//  Stacks
//
//  Created by Jacob Aguilar on 16-11-20.
//

import SwiftUI

struct ExerciseView: View {
    var body: some View {
        VStack {
            ExerciseHeaderView()
            Spacer()
            HStack {
                ExercisePricingView(title: "Básico", subTitle: "Un curso incluído", price: "$9.990", textColor: .white, backgroundColor: .green)
                ZStack {
                    PricingView(title: "Carrera", subTitle: "Toda una carrera", price: "$29.990", textColor: .white, backgroundColor: .blue)
                    Text("El mejor para empezar")
                        .font(.system(.caption, design: .rounded))
                        .foregroundColor(.white)
                        .fontWeight(.black)
                        .padding(8)
                        .background(Color.orange)
                        .cornerRadius(10)
                        .offset(x: 0, y: 65) //Con .offset, podemos indicar donde queremos posicionar un elemento dependiendo de sus ejes
                }
            }
            .padding()
            
            ZStack {
                ExercisePricingView(title: "Definitivo", subTitle: "Todos los cursos online", price: "$99.990", textColor: .white, backgroundColor: Color(red: 50/255, green: 50/255, blue: 50/255), icon: "lightbulb")
                    .padding()
                    .offset(x: 0, y: -15)
                
                Text("Conviertete en el maestro del universo")
                    .font(.system(.caption, design: .rounded))
                    .foregroundColor(.white)
                    .fontWeight(.black)
                    .padding(8)
                    .background(Color.orange)
                    .cornerRadius(10)
                    .offset(x: 0, y: 70)
            }
            Spacer()
            
        }
        
    }
}

struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExerciseHeaderView: View { //Estructura del título
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 2) { //Por defecto el alignment de la vstack viene en ".center"
                Text("Elige tu manera")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
                
                Text("de aprendizaje")
                    .font(.system(.largeTitle, design: .rounded))
                    .fontWeight(.black)
            }
            Spacer()
                
        }.padding()
    }
}

struct ExercisePricingView: View { //Estructuctura de los stacks de los frames de precios
    
    var title: String  //A través de las variables podemos llamar a la estructura desde el ContentView, y así, introducir los parámetros según deseemos
    var subTitle: String
    var price: String
    var textColor: Color
    var backgroundColor: Color
    var icon: String? //Este opcional lo creamos para poder poner la bombilla en el cuadro de "Definitivo"
    
    var body: some View {
        VStack {
            
            icon.map({
                Image(systemName: $0) //$0 es una forma de trabajar con los closures. Con eso le indicamos que hacemos referencia a la primera de las variables que en este caso es "icon". Esto se debe hacer así porque no se puede pasar a un closure el mismo valor que el del recorrido (.map)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            })
               
            
            
            Text(title)
                .font(.system(.title, design: .rounded))
                .fontWeight(.bold)
                .foregroundColor(textColor)
            Text(price)
                .font(.system(size: 32, weight: .heavy, design: .rounded))
                .foregroundColor(textColor)
            Text(subTitle)
                .font(.headline)
                .foregroundColor(textColor)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100) //Altura de la frame verde
        .padding()
        .background(backgroundColor)
        .cornerRadius(10)
    }
}

