import SwiftUI

struct TeacherScreen: View {
    let onProfileClick: () -> Void
    let onHomeClick: () -> Void
    let onActivityClick: () -> Void
    
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Panel del Docente")
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
            
            // Main Content
            ScrollView {
                VStack(spacing: 20) {
                    // Quick Actions
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 15) {
                        QuickActionCard(
                            title: "Actividades",
                            icon: "list.bullet.clipboard.fill",
                            color: .blue
                        ) {
                            onActivityClick()
                        }
                        
                        QuickActionCard(
                            title: "Reportes",
                            icon: "doc.text.fill",
                            color: .green
                        ) {
                            // Handle reports
                        }
                        
                        QuickActionCard(
                            title: "Comunicaciones",
                            icon: "message.fill",
                            color: .orange
                        ) {
                            // Handle communications
                        }
                        
                        QuickActionCard(
                            title: "Calendario",
                            icon: "calendar",
                            color: .purple
                        ) {
                            // Handle calendar
                        }
                    }
                    .padding(.horizontal)
                    
                    // Recent Activities
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Actividades Recientes")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        ForEach(1...3, id: \.self) { _ in
                            ActivityCard()
                        }
                    }
                }
            }
            
            // Bottom Tab Bar
            HStack {
                TabBarButton(
                    icon: "house.fill",
                    title: "Inicio",
                    isSelected: true,
                    action: onHomeClick
                )
                
                TabBarButton(
                    icon: "list.bullet.clipboard.fill",
                    title: "Actividades",
                    isSelected: false,
                    action: onActivityClick
                )
                
                TabBarButton(
                    icon: "person.fill",
                    title: "Perfil",
                    isSelected: false,
                    action: onProfileClick
                )
            }
            .padding(.vertical, 8)
            .background(Color(.systemBackground))
            .shadow(radius: 2)
        }
    }
}

struct QuickActionCard: View {
    let title: String
    let icon: String
    let color: Color
    let action: () -> Void
    var cardHeight: CGFloat = 140
    
    var body: some View {
        Button(action: action) {
            VStack {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(color)
                Text(title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            .frame(maxWidth: .infinity, minHeight: cardHeight)
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(10)
            .shadow(radius: 2)
        }
    }
}

struct ActivityCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Actividad de Matemáticas")
                    .font(.headline)
                Spacer()
                Text("Hace 2h")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Text("Tarea de multiplicación para el grado 3°")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            HStack {
                Label("15 estudiantes", systemImage: "person.2.fill")
                    .font(.caption)
                    .foregroundColor(.blue)
                Spacer()
                Label("Completada", systemImage: "checkmark.circle.fill")
                    .font(.caption)
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
        .padding(.horizontal)
    }
}

struct TabBarButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 24))
                Text(title)
                    .font(.caption)
            }
            .foregroundColor(isSelected ? .blue : .gray)
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    TeacherScreen(
        onProfileClick: {},
        onHomeClick: {},
        onActivityClick: {}
    )
} 
