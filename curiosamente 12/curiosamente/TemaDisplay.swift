//
//  TextView.swift
//  curiosamente
//
//  Created by Student02 on 28/04/23.
//

import SwiftUI

struct DisplayTemas: View {
    
    var cor : Tema
    var preco = "1000"
    
    var body: some View {
        ZStack{
            
            
            HStack(){
                GridRow{
                    HStack{
                        cor.textColor
                        cor.backgroundColor
                        cor.buttonColor
                        cor.detalhesColor
                        cor.auxColor
                    }
                    .cornerRadius(20)
                    
                    .padding(5)
                }
                
                .background(.white)
                .cornerRadius(20)
                
            }
            .frame(width: .infinity, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            
            
            HStack{
                
                Image(systemName: "lock.fill")
                    .font(.largeTitle)
                    .colorInvert()
                
                Text(preco)
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                
            }
            .shadow(color: .black, radius: 20, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
        }
    }
        
    
}

struct TestView: View {
   @State var tema : Tema
    var body: some View {
        ScrollView{
            VStack{
                DisplayTemas(cor: tema)
                DisplayTemas(cor: selectTema(tema: .tema2))
                DisplayTemas(cor: selectTema(tema: .tema3))
                
                
                
                
            }
        }
    }
    }


struct TestView_Previews: PreviewProvider {
    
    static var previews: some View {
        TestView(tema: selectTema(tema: EnumTemas.temadf))
    }
}
