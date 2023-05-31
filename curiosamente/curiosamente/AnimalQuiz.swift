import SwiftUI
import AVFoundation

struct AnimaisQuiz: View {

    var cor : Tema
    var quiz : Quiz
    var pergResp : PergResp = Quizes.dfAnimais
    let columnLayout = Array(repeating: GridItem(), count: 2)
    
    @State private var audioPlayer: AVAudioPlayer!
    
    @State var perguntasRestantes = 5
    @State var respondeu: Bool = false
    @State var terminou : Bool = false
    @State var respostas: [Resposta] = []
    @State var stat = Stats(pontos: 0, erros: 0, acertos: 0)
    @State var respCerta: Resposta = Resposta(string: "", isCorrect: true)
    
//------------------------------------------------------------------------------------------------------------
    func getArray4Respostas(pergResp: PergResp) -> Resposta{
        while(respostas.count > 0 ){ //limpar lixo
            respostas.removeLast()
        }
        
        let respErradas = pergResp.respostasErradas //add as respostas erradas
        
        print(respErradas)
        
        for resp in respErradas{
            respostas.append(Resposta(string: resp, isCorrect: false))
        }
        respostas.shuffle()
        
        var respCo : Resposta = Resposta(string: "", isCorrect: true) //seleciona uma pra ser a certa
        let randomInt = Int.random(in: 0...7)
        respCo = respostas[randomInt]
        respostas.remove(at: randomInt)
        respCo.isCorrect = true
        
        while(respostas.count > 3){ //remove para deixar apenas 3 respostas erradas
            respostas.removeLast()
        }
        
        respostas.append(respCo) //add a correta e embaralha
        respostas.shuffle()
        
        print(respostas)
        print(respostas.count)
        
        return respCo
    }
//------------------------------------------------------------------------------------------------------------
    //ibm.biz/z-academic
    var body: some View {
        
        NavigationStack{
            VStack {
                NavigationLink(destination: ResultadosQuiz(cor: cor, quizName: "Animais", quizPoints: stat), isActive: $terminou) {
                    EmptyView()
                }.hidden()
                
                Text(respondeu ? pergResp.descricao + "\(respCerta.string)" : pergResp.pergunta)
                    .font(.largeTitle)
                    .foregroundColor(cor.textColor)
                    .padding(.all, 20)
                    .background(cor.detalhesColor)
                    .cornerRadius(20)
                    .padding()
                
                Button (action: {
                    let soundName = respCerta.string
                    
                    guard let soundFile2 = Bundle.main.path(forResource: soundName, ofType: "mp3")else{
                        print("Could not read file named \(soundName)")
                        return
                    }
                    do{
                        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundFile2))
                        audioPlayer.play ()
                    }catch{
                        print("@ERROR: \(error.localizedDescription) creating audioPlayer.")
                    }}){
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.largeTitle)
                            .foregroundColor(cor.textColor)
                    }
                
                Spacer()
                
                ZStack{
                    LazyVGrid(columns: columnLayout, spacing: 40){
                        ForEach(respostas, id: \.string) { resp in
                            ZStack{
                                Button(action: {
                                    if(!respondeu){
                                        if(resp.isCorrect){
                                            stat.pontos += 10
                                            stat.acertos += 1
                                        }else{
                                            stat.pontos -= 2
                                            stat.erros += 1
                                        }
                                        respondeu = true
                                    }else{
                                        respCerta = getArray4Respostas(pergResp: pergResp)
                                        respondeu = false
                                        perguntasRestantes = perguntasRestantes-1
                                        if(perguntasRestantes == 0){
                                            terminou = true
                                        }
                                    }}){
                                        Image("\(resp.string)")
                                            .resizable()
                                            .frame(width: 150, height: 150)
                                    }
                                    .padding(.all,5)
                                    .background(respondeu ? (resp.isCorrect ? .green : .red) : cor.buttonColor)
                                    .cornerRadius(10)
                            }
                        }
                        
                    }
                    .padding(.vertical,10)
                    .onAppear(perform: {
                        respCerta = getArray4Respostas(pergResp: pergResp)
                    })
                }
                .background(cor.detalhesColor)
                .cornerRadius(10)
                .padding(.horizontal,10)
                
                Spacer()
                
            }
            .background(cor.backgroundColor)
            
        }.navigationBarBackButtonHidden(true)
    }
}
    
struct AnimaisQuiz_Previews: PreviewProvider {
    static var previews: some View {
        AnimaisQuiz(cor: selectTema(tema: .tema2),quiz: Quizes.animalQUIZdefault)
    }
}
