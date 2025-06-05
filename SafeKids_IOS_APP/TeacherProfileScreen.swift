import SwiftUI

struct TeacherProfileScreen: View {
    let onHomeClick: () -> Void
    let onProfileClick: () -> Void
    
    @State private var name = "Juan Pérez"
    @State private var email = "juan.perez@escuela.edu"
    @State private var phone = "+57 300 123 4567"
    @State private var grade = "3° Primaria"
    @State private var subjects = ["Matemáticas", "Ciencias"]
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Perfil del Docente")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                Button(action: onProfileClick) {
                    Image(systemName: "person.circle.fill")
                        .font(.title2)
                        .foregroundColor(.blue)
                }
            }
            .padding()
            
            ScrollView {
                VStack(spacing: 20) {
                    // Profile Image
                    VStack {
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 120, height: 120)
                            .foregroundColor(.blue)
                        
                        Button(action: {}) {
                            Text("Cambiar foto")
                                .font(.caption)
                                .foregroundColor(.blue)
                        }
                    }
                    .padding()
                    
                    // Profile Information
                    VStack(spacing: 15) {
                        ProfileField(title: "Nombre", value: $name)
                        ProfileField(title: "Correo", value: $email)
                        ProfileField(title: "Teléfono", value: $phone)
                        ProfileField(title: "Grado", value: $grade)
                        
                        // Subjects
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Materias")
                                .font(.headline)
                            
                            ForEach(subjects, id: \.self) { subject in
                                HStack {
                                    Text(subject)
                                    Spacer()
                                    Button(action: {}) {
                                        Image(systemName: "pencil")
                                            .foregroundColor(.blue)
                                    }
                                }
                                .padding()
                                .background(Color(.systemGray6))
                                .cornerRadius(8)
                            }
                            
                            Button(action: {}) {
                                Label("Agregar materia", systemImage: "plus")
                                    .foregroundColor(.blue)
                            }
                            .padding(.top, 8)
                        }
                    }
                    .padding()
                    .background(Color(.systemBackground))
                    .cornerRadius(15)
                    .shadow(radius: 2)
                    .padding(.horizontal)
                    
                    // Settings Section
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Configuración")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        SettingsButton(
                            title: "Notificaciones",
                            icon: "bell.fill",
                            color: .blue
                        ) {
                            // Handle notifications settings
                        }
                        
                        SettingsButton(
                            title: "Privacidad",
                            icon: "lock.fill",
                            color: .green
                        ) {
                            // Handle privacy settings
                        }
                        
                        SettingsButton(
                            title: "Ayuda y Soporte",
                            icon: "questionmark.circle.fill",
                            color: .orange
                        ) {
                            // Handle help and support
                        }
                        
                        SettingsButton(
                            title: "Cerrar Sesión",
                            icon: "rectangle.portrait.and.arrow.right",
                            color: .red
                        ) {
                            // Handle logout
                        }
                    }
                }
            }
            
            // Bottom Tab Bar
            HStack {
                TabBarButton(
                    icon: "house.fill",
                    title: "Inicio",
                    isSelected: false,
                    action: onHomeClick
                )
                
                TabBarButton(
                    icon: "list.bullet.clipboard.fill",
                    title: "Actividades",
                    isSelected: false,
                    action: {}
                )
                
                TabBarButton(
                    icon: "person.fill",
                    title: "Perfil",
                    isSelected: true,
                    action: onProfileClick
                )
            }
            .padding(.vertical, 8)
            .background(Color(.systemBackground))
            .shadow(radius: 2)
        }
    }
}

struct ProfileField: View {
    let title: String
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            TextField(title, text: $value)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
    }
}

struct SettingsButton: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: icon)
                    .foregroundColor(color)
                Text(title)
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 2)
            .padding(.horizontal)
        }
    }
}

#Preview {
    TeacherProfileScreen(
        onHomeClick: {},
        onProfileClick: {}
    )
} 