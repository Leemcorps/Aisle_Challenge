//
//  ContentView.swift
//  AisleVersion2
//
//  Created by Azhar Bahleem on 23/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var phoneNumber = ""
    @State private var enteredOTP = ""
    @State private var authToken = ""
    @State private var showScreen1 = true
    @State private var showScreen2 = false
    @State private var showScreen3 = false
    
    
    //Timer
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    @State var count: Int = 59
    @State var finishedText: String? = nil
    
    
    
    var body: some View {
        if showScreen1 {
            //phoneNumberScreen Starts
            ZStack {
                VStack(alignment: .leading) {
                    Text("Get OTP")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.black)
                    
                    Text("Enter Your Phone Number")
                    .font(.system(size: 30, weight: .heavy))
                    .foregroundColor(.black)
                    .frame(width: 220, height: 72)
                    
                    
                    
                    HStack {
                        ZStack {
                            
                            Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 64, height: 36)
                            .cornerRadius(8)
                            .overlay(
                            RoundedRectangle(cornerRadius: 8)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.77, green: 0.77, blue: 0.77), lineWidth: 1))
                            
                            Text("+91")
                            .keyboardType(.numberPad)
                            .font(.system(size: 18, weight: .bold))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                        }
                        
                        
                        ZStack {
                            
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 147, height: 36)
                                .cornerRadius(8)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                        .inset(by: 0.5)
                                        .stroke(Color(red: 0.77, green: 0.77, blue: 0.77), lineWidth: 1))
                            
                            TextField("", text: $phoneNumber)
                                .font(.system(size: 18, weight: .bold))
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .keyboardType(.numberPad)
                        }
                        
                        //Spacer()
                        
                    }
                    
                    ZStack {
                        Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 96, height: 40)
                        .background(Color(red: 0.98, green: 0.8, blue: 0.06))
                        .cornerRadius(20)
                        
                        
                        Button("Continue", action: verifyPhoneNumber)
                        .font(.system(size: 14, weight: .bold))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        
                    }
                }
            }//ZStack Main
            //PhoneNumberScreen Ends
            
            
            
            
        } else if showScreen2 {
            //OTP screen stars
            
            ZStack {
                Color.accentColor.ignoresSafeArea(.all)
                
                HStack {
                    ZStack {
                        VStack(alignment: .leading) {
                            HStack {
                                Text("+91 9876543212")
                                    .font(.system(size: 18, weight: .medium))
                                    .foregroundColor(.black)
                                    .frame(width: 152, height: 30)
                                
                                Image("fluent_edit-24-filled")
                                .frame(width: 14, height: 14)
                            }
                            
                            Text("Enter The OTP")
                                .font(.system(size: 30, weight: .heavy))
                                .foregroundColor(.black)
                                                            
                            
                            
                            ZStack {
                                Rectangle()
                                  .foregroundColor(.clear)
                                  .frame(width: 78, height: 36)
                                  .cornerRadius(8)
                                  .overlay(
                                    RoundedRectangle(cornerRadius: 8)
                                      .inset(by: 0.5)
                                      .stroke(Color(red: 0.77, green: 0.77, blue: 0.77), lineWidth: 1))
                                  
                                
                                TextField("", text: $enteredOTP)
                                  .font(.system(size: 18, weight: .bold))
                                  .multilineTextAlignment(.center)
                                  .foregroundColor(.black)
                            }
                            
                            HStack {
                                ZStack {
                                    Rectangle()
                                      .foregroundColor(.clear)
                                      .frame(width: 96, height: 40)
                                      .background(Color(red: 0.98, green: 0.8, blue: 0.06))
                                      .cornerRadius(20)
                                      
                                    
                                    
                                    Button("Continue", action: verifyOTP)
                                      .font(.system(size: 14, weight: .bold))
                                      .multilineTextAlignment(.center)
                                      .foregroundColor(.black)
                                      
                                }
                                
                                ZStack{
                                    
                                    Text(finishedText ?? "\(count)")
                                        .font(Font.system(size: 14, weight: .bold))
                                        .fontWeight(.bold)
                                        .multilineTextAlignment(.center)
                                        .foregroundColor(.black)
                                    
                                    
                                    
                                }
                                .onReceive(timer, perform: { _ in
                                    if count <= 1 {
                                        finishedText = "Resend OTP"
                                    } else {
                                        count -= 1
                                    }
                                })
                            }
                            
                            Spacer()
                            
                        }.frame(width: 170)
                    }.padding(40)
                    
                    Spacer()
                    
                }
            }//ends
            
            //OTP screen ends
            
            
            
            
            
        } else if showScreen3 {
            ScrollView {
                ZStack {
                    VStack {

                                Text("Authenticated! \(authToken)")
                                Text("Notes")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(.black)
                                    .frame(width: 102, alignment: .top)
                
                                Text("Personal messages to you")
                                    .font(.body)
                                    .fontWeight(.semibold)
                                    .foregroundColor(.black)
                
                                ZStack(alignment: .bottomLeading){
                                    Image("Image1")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 370, height: 370)
                                        .clipped()
                                        .cornerRadius(20)
                
                                    VStack(alignment: .leading) {
                                        Text("Meena, 23")
                                            .font(.title)
                                            .fontWeight(.heavy)
                                            .foregroundColor(.white)
                                        // .multilineTextAlignment(.leading)
                
                
                                        Text("Tap to review 50+ notes")
                                            .font(.headline)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.white)
                                        // .multilineTextAlignment(.leading)
                
                                    }.padding()
                
                                }
                
                
                
                                HStack{
                
                                VStack(alignment: .leading) {
                                    Text("Interested In You")
                                        .font(.title2)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.black)
                                        .frame(width: 273 ,alignment: .topLeading)
                                    //.padding(.horizontal, 29)
                                        //.padding(.top, 25)
                
                
                                    Text("Premium members can view all their likes at once")
                                        .font(.callout)
                                        .foregroundColor(Color(red: 0.61, green: 0.61, blue: 0.61))
                                        .frame(width: 192, height: 91, alignment: .topLeading)
                
                                }.padding(.horizontal, -29)
                
                
                
                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.clear)
                                        .background(Color(red: 0.99, green: 0.87, blue: 0.01))
                                        .cornerRadius(24.5)
                
                
                                    Text("Upgrade")
                                        .font(.body)
                                        .fontWeight(.heavy)
                                        .foregroundColor(.black)
                
                                }.frame(width: 113, height: 50)
                                        .padding(.horizontal, -29)
                                        .padding(.bottom, 35)
                
                
                            }//Hstack
                                .padding(.vertical)
                                //.padding(.horizontal, 29)
                
                
                
                                HStack{
                
                                    ZStack(alignment: .bottomLeading) {
                
                                        Image("Teena")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 180, height: 255)
                                            .clipped()
                                            .cornerRadius(20)
                                        //.padding(.horizontal)
                
                
                                        Text("Teena")
                                            .font(.title2)
                                            .fontWeight(.heavy)
                                            .foregroundColor(.white)
                                            .padding()
                
                                    }
                
                
                                    ZStack(alignment: .bottomLeading) {
                                        Image("Beena")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 180, height: 255)
                                            .clipped()
                                            .cornerRadius(20)
                                        //.padding(.horizontal)
                
                                        Text("Beena")
                                            .font(.title2)
                                            .fontWeight(.heavy)
                                            .foregroundColor(.white)
                                            .padding()
                
                
                            }
                
                        }.padding(.horizontal)
                
                    }
                }
            }
        }
    }
    
    func verifyPhoneNumber() {
        let apiUrl = "https://app.aisle.co/V1/users/phone_number_login"
        let parameters = ["number": phoneNumber]
        
        makePostRequest(url: apiUrl, parameters: parameters) { success in
            if success {
                showScreen1 = false
                showScreen2 = true
            }
        }
    }
    
    func verifyOTP() {
        let apiUrl = "https://app.aisle.co/V1/users/verify_otp"
        let parameters = ["number": phoneNumber, "otp": enteredOTP]
        
        makePostRequest(url: apiUrl, parameters: parameters) { success in
            if success {
                // Assuming you get an auth token from the response
                authToken = "Welcome To Aisle"
                showScreen2 = false
                showScreen3 = true
            }
        }
    }
    
    // Function to make a POST request
    func makePostRequest(url: String, parameters: [String: Any], completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: url) else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
        } catch {
            completion(false)
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if data != nil {
                // Parse and handle response data here
                completion(true) // Indicate success
            } else {
                completion(false) // Indicate failure
            }
        }.resume()
    }
}

