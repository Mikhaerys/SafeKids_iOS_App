import SwiftUI

struct GuardianProfileScreen: View {
    let onHomeClick: () -> Void
    let onProfileClick: () -> Void
    
    @State private var name = "María García"
    @State private var email = "maria.garcia@email.com"
    @State private var phone = "+57 300 987 6543"
    @State private var students = ["Ana García", "Carlos García"]
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Perfil del Acudiente")
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
                        
                        // Students
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Estudiantes a cargo")
                                .font(.headline)
                            
                            ForEach(students, id: \.self) { student in
                                HStack {
                                    Image(systemName: "person.fill")
                                        .foregroundColor(.blue)
                                    Text(student)
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
                                Label("Agregar estudiante", systemImage: "plus")
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
                    
                    // Payment Information
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Información de Pago")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        PaymentInfoCard(
                            title: "Método de Pago",
                            value: "Tarjeta de Crédito",
                            icon: "creditcard.fill",
                            color: .blue
                        )
                        
                        PaymentInfoCard(
                            title: "Último Pago",
                            value: "$150.000",
                            icon: "dollarsign.circle.fill",
                            color: .green
                        )
                        
                        PaymentInfoCard(
                            title: "Próximo Pago",
                            value: "15/04/2024",
                            icon: "calendar",
                            color: .orange
                        )
                    }
                    
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
                    icon: "dollarsign.circle.fill",
                    title: "Pagos",
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

struct PaymentInfoCard: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(color)
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text(value)
                    .font(.headline)
            }
            
            Spacer()
            
            Button(action: {}) {
                Image(systemName: "pencil")
                    .foregroundColor(.blue)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

#Preview {
    GuardianProfileScreen(
        onHomeClick: {},
        onProfileClick: {}
    )
} 