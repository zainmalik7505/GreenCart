//
//  ForgetPassword.swift
//  GreenCart
//
//  Created by Zain Malik on 21/10/2024.
//

import SwiftUI


struct ForgotPasswordView: View {
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    
    @StateObject var forgotVM = ForgetPasswordModel()
    
    @State private var isEmail: Bool = false
    
    
    var body: some View {
        ZStack {
            Image("bottom_bg")
            .resizable()
            .scaledToFill()
            .frame(width: .screenWidth, height: .screenHeight)
            
            
            VStack{
                
                
                Image("color_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .padding(.bottom, .screenWidth * 0.1)
                
                
                Text("Forgot Password")
                    .font(.customfont(.semibold, fontSize: 26))
                    .foregroundColor(.primaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 4)
                
                Text("Enter your emails")
                    .font(.customfont(.semibold, fontSize: 16))
                    .foregroundColor(.secondaryText)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, .screenWidth * 0.1)
                
                LineTextField( title: "Email", placholder: "Enter your email address", txt: $forgotVM.email , keyboardType: .emailAddress)
                    .padding(.bottom, .screenWidth * 0.07)
                
                
                
                
                RoundButton(title: "Submit") {
                    Task{
                        do{
                            try await forgotVM.resetPasswordWithEmail()
                            isEmail = true
                            print("Password Forget Successfully")
                        }catch{
                            print(error)
                        }
                    }
                }
                .padding(.bottom, .screenWidth * 0.05)
                
                
                
                Spacer()
            }
            
            .padding(.top, .topInsets + 64)
            .padding(.horizontal, 20)
            .padding(.bottom, .bottomInsets)
            
            
            VStack {
                    
                HStack {
                    Button {
                        mode.wrappedValue.dismiss()
                    } label: {
                        Image("back")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                    }
                    
                    Spacer()

                }
                
                Spacer()
                
            }
            .padding(.top, .topInsets)
            .padding(.horizontal, 20)
            NavigationLink(destination: PasswordResetConfirmationView(), isActive: $isEmail) {
                EmptyView() 
            }
            
            
        }
//        .alert(isPresented: $forgotVM.showError) {
//                
//            Alert(title: Text(Globs.AppName), message: Text( forgotVM.errorMessage ), dismissButton: .default(Text("Ok")))
//        }
//        .background( NavigationLink(destination: OTPView(), isActive: $forgotVM.showVerify,  label: {
//            EmptyView()
//        }) )
//        .background( NavigationLink(destination: ForgotPasswordSetView(), isActive: $forgotVM.showSetPassword,  label: {
//            EmptyView()
//        }) )
        .background(Color.white)
        .navigationTitle("")
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .ignoresSafeArea()
        

    }
}


#Preview {
    ForgotPasswordView()
}
