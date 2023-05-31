import SwiftUI

struct MenuAnimal: View {
    var cor : Tema
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    var quizArray: [Quiz] = [Quizes.animalQUIZdefault,Quizes.animalQUIZdefault,Quizes.animalQUIZdefault,Quizes.animalQUIZdefault]
    
    var body: some View {
        NavigationStack{
            ZStack{
                
                cor.backgroundColor.ignoresSafeArea()
                VStack{
                    Text("Quizes Animais")
                        .font(.largeTitle)
                        .padding()
                        .background(cor.detalhesColor)
                        .cornerRadius(15)
                        .foregroundColor(cor.textColor)
                        
                    ScrollView{
                        LazyVGrid(columns: columnLayout){
                            ForEach(quizArray, id: \.descricao){ q in
                                NavigationLink(destination : {
                                    
                                    AnimaisQuiz(cor: cor, quiz: q)
                                    
                                }){
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 25)
                                            .aspectRatio(1.0,contentMode: ContentMode.fit)
                                            .foregroundColor(cor.buttonColor)
                                        VStack{
                                            Text("\(q.descricao)")
                                                .font(.title)
                                                .foregroundColor(cor.textColor)
                                        }
                                    }
                                }
                            }.padding(5)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
    struct MenuAnimal_Previews: PreviewProvider {
        static var previews: some View {
            MenuAnimal(cor: selectTema(tema: .temadf))
        }
    }
