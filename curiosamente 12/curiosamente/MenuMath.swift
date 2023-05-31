//
//  MenuGeo.swift
//  curiosamente
//
//  Created by Student02 on 09/05/23.
//

import SwiftUI

struct MenuMath: View {
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    
    
  @State  var cor : Tema
    
    @StateObject var model = QuizModel()
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                cor.backgroundColor.ignoresSafeArea()
                VStack{
                    Text("Quizes Matematica")
                        .font(.largeTitle)
                        .padding()
                        .background(cor.detalhesColor)
                        .cornerRadius(15)
                        .foregroundColor(cor.textColor)
                        
                    ScrollView{
                        LazyVGrid(columns: columnLayout){
                            ForEach(model.questions, id: \._id){ q in
                                NavigationLink(destination : {
                                    
                                    MathQuiz(cor: cor, quiz: q)
                                    
                                }){
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 25)
                                            .aspectRatio(1.0,contentMode: ContentMode.fit)
                                            .foregroundColor(cor.buttonColor)
                                        VStack{
                                            Text("\(q.categoria)")
                                                .font(.title)
                                                .foregroundColor(cor.textColor)
                                        }
                                    }
                                    
                                }
                            }.padding(5)
                        }
                    }
                    .padding()
                    .onAppear(){
                        model.fetch(codigo: "quiz/mat")
                        cor = GLOBAL.tema  
                    }
                }
            }
        }
    }
}
    struct MathText_Previews: PreviewProvider {
        static var previews: some View {
            MenuMath(cor: selectTema(tema: .temadf))
        }
    }

