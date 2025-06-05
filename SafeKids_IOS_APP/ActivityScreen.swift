import SwiftUI

struct ActivityScreen: View {
    let onHomeClick: () -> Void
    let onProfileClick: () -> Void

    @State private var selectedStudent = "Nombre del estudiante"
    let students = ["Nombre del estudiante", "Estudiante 1", "Estudiante 2"]

    let activities = [
        ("21/03/2025", "1:30"),
        ("21/03/2025", "6:45"),
        ("22/03/2025", "10:00")
    ]	

    var body: some View {
        VStack(spacing: 16) {
            // Encabezado ACTVIDAD
            HStack {
                Text("ACTIVIDAD")
                    .font(.title2)
                    .fontWeight(.bold)
                Spacer()
                // Placeholder para logo
                Rectangle()
                    .frame(width: 40, height: 40)
            }
            .padding(.horizontal)

            // Selector de estudiante
            Picker("Nombre del estudiante", selection: $selectedStudent) {
                ForEach(students, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.menu)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color(.systemGray5))
            .cornerRadius(10)

            // Lista de actividades
            VStack(spacing: 12) {
                ForEach(activities, id: \.0) { activity in
                    HStack {
                        Text(activity.0)
                        Spacer()
                        Text(activity.1)
                    }
                    .padding()
                    .background(Color(.systemGray4))
                    .cornerRadius(12)
                    .padding(.horizontal)
                }
            }

            Spacer()

            // Barra inferior (no modificada)
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
                    isSelected: true,
                    action: {}
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
