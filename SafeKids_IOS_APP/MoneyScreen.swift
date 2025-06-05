import SwiftUI

struct MoneyScreen: View {
    let onHomeClick: () -> Void
    let onProfileClick: () -> Void

    let gastos = [
        "Gasto 1",
        "Gasto 2",
        "Gasto 3",
        "Gasto 4",
        "Gasto 5",
        "Gasto 6"
    ]

    var body: some View {
        VStack(spacing: 16) {
            // Header Acudiente
            HStack {
                Text("Pagos")
                    .font(.title2)
                    .fontWeight(.semibold)
                Spacer()
                Rectangle() // Placeholder para el logo
                    .frame(width: 40, height: 40)
            }
            .padding(.horizontal)

            // Sección DINERO
            Text("DINERO")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .background(Color(.systemBlue).opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.horizontal)

            // Botones de acción
            HStack(spacing: 20) {
                Button(action: {
                    // Acción de recargar
                }) {
                    HStack {
                        Image(systemName: "dollarsign.circle")
                        Text("Recargar")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(10)
                }

                Button(action: {
                    // Acción de bloquear
                }) {
                    HStack {
                        Image(systemName: "nosign")
                        Text("Bloquear")
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red.opacity(0.2))
                    .cornerRadius(10)
                }
            }
            .padding(.horizontal)

            // Título Gastos
            Text("Gastos")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

            // Lista de gastos
            VStack(spacing: 12) {
                ForEach(gastos, id: \.self) { gasto in
                    HStack {
                        Text(gasto)
                            .font(.body)
                        Spacer()
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(.systemGray4))
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
            }

            Spacer()

            // Barra inferior (NO modificar)
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
