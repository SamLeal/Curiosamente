
import SwiftUI
import MapKit


struct MapQuiz2: View {
    
    
   @State var cor : Tema
    
    var quiz : Quiz
    
    @State var pergResp : PergResp = Quizes.dfGeoQuiz
    
    @State var stat = Stats(pontos: 0, erros: 0, acertos: 0)
    @State var respostas : [Resposta] = []
    
    @State var zoomPre = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    @State var zoomPos = MKCoordinateSpan(latitudeDelta: 130, longitudeDelta: 130)
       
    @State var region : MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: -19.924433,
            longitude: -19.924433),
        span: MKCoordinateSpan(latitudeDelta: 130, longitudeDelta: 130))
    
    @State var respondeu = false
    @State var terminou = false
    @State var quizIndex = 0
    
    func randResps() -> [Resposta]{
        
        var arrayResp : [Resposta] = []
        arrayResp.append(Resposta(string: pergResp.respostaCorreta, isCorrect: true))
        
        let respErradas = pergResp.respostasErradas
        
        for resp in respErradas{
            arrayResp.append(Resposta(string: resp, isCorrect: false))
        }
        
        arrayResp.shuffle()
        
        return arrayResp
    }
    
    func nextQuiz(){
        if(quiz.pergResp.count>quizIndex){
            pergResp = quiz.pergResp[quizIndex]
            respostas = randResps()
            
            zoomPos = MKCoordinateSpan(
                latitudeDelta: pergResp.region!.zoomPos,
                longitudeDelta: pergResp.region!.zoomPos)
            zoomPre = MKCoordinateSpan(
                latitudeDelta: pergResp.region!.zoomPre,
                longitudeDelta: pergResp.region!.zoomPre)
            
            region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: pergResp.region!.latitude,
                    longitude: pergResp.region!.longitude),
                span: zoomPre )
            
            
            
            quizIndex += 1
            respondeu = false
        }else{
            terminou = true
            print("teste")
        }
    }
    var body: some View {
        NavigationStack{
            
            ZStack{
                
                NavigationLink(destination: ResultadosQuiz(cor: cor, quizName: quiz.categoria, quizPoints: stat), isActive: $terminou) {
                    EmptyView()
                }.hidden()
                
                VStack(spacing: 2){
                    Spacer()
                    Text("\(pergResp.pergunta)")
                        .font(.custom("Fredoka One", size: 30))
                        .fontWeight(.heavy)
                        .foregroundColor(cor.textColor)
                    HStack {
                        Text("\(quizIndex) / \(quiz.pergResp.count)")
                            .foregroundColor(cor.buttonColor)
                            .font(.custom("Fredoka One", size: 28))
                            .shadow(radius: 5)
                    }
                    .ignoresSafeArea()
                    .padding(.trailing, 20)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            
                    Map(coordinateRegion: $region)
                                        .allowsHitTesting(respondeu)
                                        .animation(.default, value: respondeu)
                                        .cornerRadius(15)
                    HStack{
                        Text(respondeu ? pergResp.descricao: "")
                            .animation(.default, value: respondeu)
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(cor.textColor)
                        
                    }
                    .padding(.top, 5)
                    .background(cor.detalhesColor)
                    Spacer()
                    VStack{
                        
                        //dev only
//                        Button("reset"){
//                            respondeu=false
//
//
//                            region = MKCoordinateRegion(
//                                center: CLLocationCoordinate2D(
//                                    latitude: pergResp.region!.latitude,
//                                    longitude: pergResp.region!.longitude),
//                                span: zoomPre)
//                        }
                        //fim
                        
                        ForEach(respostas, id: \.string) {
                            resp in
                            Button(action: {
                                
                                region = MKCoordinateRegion(
                                    center: CLLocationCoordinate2D(
                                        latitude: pergResp.region!.latitude,
                                        longitude: pergResp.region!.longitude),
                                    span: zoomPos)
                                
                                if(!respondeu){
                                    
                                    if(resp.isCorrect){
                                        stat.pontos += 50
                                        stat.acertos += 1
                                    }else{
                                        //stat.pontos -= 2
                                        stat.erros += 1
                                    }
                                    respondeu = true
                                }else {
                                    nextQuiz()
                                    
                                }
                                
                                
                            }, label: {
                                HStack{
                                    Spacer()
                                    Text(resp.string)
                                        .foregroundColor(cor.textColor)
                                        .font(.title)
                                    Spacer()
                                }
                                .padding(.all,5)
                                .background(respondeu ? (resp.isCorrect ? .green : .red) : cor.buttonColor)
                                .cornerRadius(10)
                                .fontWeight(.bold)
                            })
                            
                        }
                        .padding(.horizontal,15.0)
                        .font(.custom("Fredoka One", size: 26))
                    }
            
                }
                
                .padding(.horizontal,5.0)
                .background(cor.detalhesColor)
                .frame(width: .infinity)
            }.onAppear(){
                
                cor = GLOBAL.tema    
                
                
                pergResp = quiz.pergResp[quizIndex]
                respostas = randResps()
                quizIndex += 1
                
                zoomPos = MKCoordinateSpan(
                    latitudeDelta: pergResp.region!.zoomPos,
                    longitudeDelta: pergResp.region!.zoomPos)
                zoomPre = MKCoordinateSpan(
                    latitudeDelta: pergResp.region!.zoomPre,
                    longitudeDelta: pergResp.region!.zoomPre)
                
                region = MKCoordinateRegion(
                    center: CLLocationCoordinate2D(
                        latitude: pergResp.region!.latitude,
                        longitude: pergResp.region!.longitude),
                    span: zoomPre )
                
                // MKMapView.appearance().mapType = .satellite
            }
        }.navigationBarBackButtonHidden(true)
    }
}
struct MapQuiz2_Previews: PreviewProvider {
    static var previews: some View {
        
        MapQuiz2(cor: selectTema(tema: .temadf), quiz: Quizes.geoQUIZdefault)
    }
}

