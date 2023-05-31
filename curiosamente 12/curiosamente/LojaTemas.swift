//
//  LojaTemas.swift
//  curiosamente
//
//  Created by Student24 on 08/05/23.
//

import SwiftUI

struct DisplayCoresTemas: View {
    
    @State var cor : Tema
    var preco = "1000"
    
    
    var body: some View {
        HStack {
            // Cores do Tema
            ZStack {
                Circle()
                    .fill(cor.textColor)
                    .frame(width: 40, height: 40)
                    .padding(.bottom, 80)
                    .shadow(radius: 5)
                
                Circle()
                    .fill(cor.backgroundColor)
                    .frame(width: 40, height: 40)
                    .padding(.leading, 75)
                    .padding(.bottom, 25)
                    .shadow(radius: 5)
                
                Circle()
                    .fill(cor.buttonColor)
                    .frame(width: 40, height: 40)
                    .padding(.top, 65)
                    .padding(.leading, 50)
                    .shadow(radius: 5)
                
                Circle()
                    .fill(cor.auxColor)
                    .frame(width: 40, height: 40)
                    .padding(.top, 65)
                    .padding(.trailing, 50)
                    .shadow(radius: 5)
                
                Circle()
                    .fill(cor.detalhesColor)
                    .frame(width: 40, height: 40)
                    .padding(.trailing, 75)
                    .padding(.bottom, 25)
                    .shadow(radius: 5)
      
                    
            }
            .frame(width: 120, height: 120)
            
            // Informações sobre o Tema
            VStack (alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(cor.nomeTema)
                        .font(.custom("Fredoka One", size: 22))
                        .lineLimit(nil)
                    
                    Text(cor.descricaoTema)
                        .font(.subheadline)
                }.foregroundColor(cor.textColor)
                
                Spacer()
                
                // Compra do Tema
                HStack {
//                    Button("Comprar") {
//
//                    }
//                    .foregroundColor(cor.textColor)
//                    .font(.custom("Fredoka One", size: 15))
//                    .padding(10)
//                    .background(cor.buttonColor)
//                    .cornerRadius(10)
//                    .shadow(radius: 5)
//
                    Spacer()
                    
                        HStack {
                            Image(systemName: "trophy.fill")
                                .font(.custom("Fredoka One", size: 18))
                            Text("\(cor.preco)")
                                .font(.custom("Fredoka One", size: 22))
                        } .foregroundColor(cor.auxColor)
                    
                }
            }
            .padding(.leading, 10)
            .frame(minHeight: 0, maxHeight: 120)
        }
        .padding()
        .background(cor.backgroundColor)
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.leading)
        .padding(.trailing)
        .padding(.top,10)
    }
}

struct LojaTemas: View {
    
    @State var tema : Tema
    
    @State var totalPoints : Int = 0
    
    let defaults = UserDefaults.standard
    
    @State var prefixField: String = "http://127.0.0.1:1880/"

    func selecionar(cor: Tema){
        tema = cor
        defaults.set(cor.nomeTema, forKey: "Tema")
        
        GLOBAL.tema = cor
        print(cor.nomeTema)
    }
    
    
    

    var body: some View {
        NavigationStack {
            ZStack {
                tema.backgroundColor.ignoresSafeArea()
                VStack {
                    HStack {
                        Text("Créditos:")
                       // Text(tema.nomeTema)
                            .font(.largeTitle)
                            .foregroundColor(tema.textColor)
                        Spacer()
                        
                        Text("\(GLOBAL.pontos)")
                            .multilineTextAlignment(.trailing)
                            .foregroundColor(tema.textColor)
                    }
                    .foregroundColor(tema.textColor)
                    .font(.custom("Fredoka One", size: 32))
                    .padding()
                    .background(tema.detalhesColor)
                    .cornerRadius(15)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .shadow(radius: 5)
                    .padding()
                  
                    
                    Spacer()
                }
                   
                // ScrollView com os temas
                ScrollView {
                    VStack {
                        
                        ForEach(EnumTemas.allCases, id: \.hashValue) { item in
                            
                          
//                            }
                            Button(action: {
                                selecionar(cor: selectTema(tema: item))
                            }, label: {
                                DisplayCoresTemas(
                                    cor: selectTema(tema: item))
                                
                                
                            })
                            
                           
                            
                            
                        }
                               TextField("db prefix", text: $prefixField)
                            .padding()
                            .background(tema.auxColor)
                            .cornerRadius(5)
                            
                        
                        Button("update db prefix", action: {
                            print("pre \(prefixField)")
                            GLOBAL.prefix = prefixField
                            print("pos \(prefixField)")
                        })
                        .padding()
                        .foregroundColor(tema.textColor)
                        .background(tema.buttonColor)
                        .cornerRadius(10)
                    
                    }
                } .padding(.top,100)
                    .onAppear(){
                    prefixField = "http://127.0.0.1:1880/"
//
//                        totalPoints = defaults.integer(forKey: "TotalPoints")
                        tema = GLOBAL.tema    
                    }
                
                
            }
        }
    }
}

struct LojaTemas_Previews: PreviewProvider {
    static var previews: some View {
        LojaTemas(tema: selectTema(tema: EnumTemas.temadf))
    }
}

