import SwiftUI

struct LoginScreen: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    let onTeacherClick: () -> Void
    let onGuardianClick: () -> Void
    let onDescriptionClick: () -> Void
    
    private func validateCredentials(role: String) {
        if username.lowercased() == "bryan" && password == "1234" {
            if role == "teacher" {
                onTeacherClick()
            } else {
                onGuardianClick()
            }
        } else {
            alertMessage = "Usuario o contraseña incorrectos"
            showAlert = true
        }
    }
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "person.2.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding(.top, 50)
            
            Text("SafeKids")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text("Bienvenido a SafeKids")
                .font(.title2)
                .foregroundColor(.secondary)
            
            Spacer()
            
            VStack(spacing: 15) {
                TextField("Usuario", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)

                SecureField("Contraseña", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: {
                    validateCredentials(role: "teacher")
                }) {
                    HStack {
                        Image(systemName: "person.fill")
                        Text("Soy Docente")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }

                Button(action: {
                    validateCredentials(role: "guardian")
                }) {
                    HStack {
                        Image(systemName: "person.2.fill")
                        Text("Soy Acudiente")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }

                Button(action: onDescriptionClick) {
                    Text("¿Qué es SafeKids?")
                        .foregroundColor(.blue)
                }
                .padding(.top)
            }
            .padding(.horizontal, 30)

            Spacer()
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    LoginScreen(
        onTeacherClick: { print("Acceso docente concedido") },
        onGuardianClick: { print("Acceso acudiente concedido") },
        onDescriptionClick: { print("Mostrar descripción") }
    )
}

