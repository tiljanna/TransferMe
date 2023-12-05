//
//  OnBoardingView.swift
//  TransferMe
//
//  Created by Putut Yusri Bahtiar on 09/11/23.
//

import SwiftUI

struct OnBoardingModel {
    let image: String
    let title: String
    let subTitle: String
}


struct OnBoardingView: View {
    @State private var currentStep = 0
    
    let datas = [
        OnBoardingModel(image: "onboard1", title: "Easy, Fast & Trusted", subTitle: "Fast money transfer and gauranteed safe transactions with others."),
        OnBoardingModel(image: "onboard2", title: "Saving Your Money", subTitle: "Track the progress of your savings and start a habit of saving with TransferMe."),
        OnBoardingModel(image: "onboard3", title: "Free Transactions", subTitle: "Provides the quality of the financial system with free money transactions without any fees."),
        OnBoardingModel(image: "onboard4", title: "International Transactions", subTitle: "Provides the 100% freedom of the  financial management with lowest fees on International transactions."),
        OnBoardingModel(image: "onboard5", title: "Multiple Credit Cards", subTitle: "Provides the 100% freedom of the financial management with Multiple Payment Options for local & International Payments."),
        OnBoardingModel(image: "onboard6", title: "Bills Payment Made Easy", subTitle: "Pay monthly or daily bills at home in a site of TransferMe."),
        OnBoardingModel(image: "onboard7", title: "Color Your Cards", subTitle: "Provides better cards management  when using Multiple Cards by using a  different color for each payment  method.")
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                TabView(selection: $currentStep.animation()) {
                    ForEach(0..<datas.count, id: \.self) { index in
                        VStack {
                            Image(datas[index].image)
                                .resizable()
                                .frame(width: 300, height: 270)
                            
                            Text(datas[index].title)
                                .font(.title)
                                .fontWeight(.bold)
                                .frame(maxWidth: .infinity, maxHeight: 80, alignment: .center)
                            
                            Text(datas[index].subTitle)
                                .foregroundStyle(Color.gray)
                                .font(.system(size: 13, weight: .medium))
                                .frame(width: 300, height: 50)
                                .multilineTextAlignment(.center)
                        }
                        .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<datas.count, id: \.self) { index in
                            
                            Circle()
                                .frame(width: index == currentStep ? 12 : 8, height: index == currentStep ? 16 : 10)
                                .foregroundStyle(Color("hanBlue").opacity(index == currentStep ? 1 : 0.5))
                        }
                    }
                    .padding()
                    .scrollTargetLayout()
                }
                .background(.clear, in: RoundedRectangle(cornerRadius: 30))
                .frame(width: 60)
                .scrollTargetBehavior(.viewAligned)
                .scrollPosition(id: Binding($currentStep), anchor: .center)
                .allowsTightening(false)
                
                if currentStep == datas.count - 1 {
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        DispatchQueue.main.async {
                            // Change the root view to OnBoardingView
                            let window = UIApplication.shared.connectedScenes.flatMap { ($0 as? UIWindowScene)?.windows ?? [] }.first { $0.isKeyWindow }
                            window?.rootViewController = UIHostingController(rootView: LoginView())
                        }
                    }) {
                        Text("Continue")
                            .foregroundStyle(Color.white)
                            .frame(width: 200,height: 50)
                            .background(Color("hanBlue"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                            .shadow(color: Color("hanBlue"), radius: 5)
                    }
                } else {
                    Button(action: {
                        UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                        withAnimation {
                            if currentStep < datas.count - 1 {
                                currentStep += 1
                            }
                        }
                    }) {
                        Text("Continue")
                            .foregroundStyle(Color.white)
                            .frame(width: 200,height: 50)
                            .background(Color("hanBlue"))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .padding()
                            .shadow(color: Color("hanBlue"), radius: 5)
                    }
                }
            }
        }
    }
}

#Preview {
    OnBoardingView()
}
