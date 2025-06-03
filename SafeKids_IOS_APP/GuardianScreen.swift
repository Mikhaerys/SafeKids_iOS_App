import SwiftUI

struct GuardianScreen: View {
    let onProfileClick: () -> Void
    let onHomeClick: () -> Void
    let onActivityClick: () -> Void
    let onMoneyClick: () -> Void

    
    var body: some View {
        VStack {
            // Header
            HStack {
                Text("Panel del Acudiente")
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
                Spacer()
                    .frame(height: 20)
                VStack(spacing: 10) {
                    // Quick Actions
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        QuickActionCard(
                            title: "Actividades",
                            icon: "list.bullet.clipboard.fill",
                            color: .blue,
                            cardHeight: 70
                        ) {
                            onActivityClick()
                        }
                        
                        QuickActionCard(
                            title: "Pagos",
                            icon: "dollarsign.circle.fill",
                            color: .green,
                            cardHeight: 70

                        ) {
                            onMoneyClick()
                        }
                    }
                    .padding(.horizontal)
                    
                    // Payment Status
                    VStack(alignment: .leading, spacing: 15) {
                        Text("Estado de Pagos")
                            .font(.headline)
                            .padding(.horizontal)
                        
                        PaymentStatusCard()
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
                    icon: "dollarsign.circle.fill",
                    title: "Pagos",
                    isSelected: false,
                    action: onMoneyClick
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

struct PaymentStatusCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text("Monto Actual")
                    .font(.headline)
                Spacer()
                Text("COP")
                    .font(.caption)
                    .foregroundColor(.green)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color.green.opacity(0.2))
                    .cornerRadius(8)
            }
            
            Divider()
            
            HStack {
                VStack(alignment: .leading) {
                    Text("$150.000")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                VStack(alignment: .trailing) {
                    Text("Fecha de Pago")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                    Text("03/06/2025")
                        .font(.subheadline)
                        .fontWeight(.medium)
                }
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
    GuardianScreen(
        onProfileClick: {},
        onHomeClick: {},
        onActivityClick: {},
        onMoneyClick: {}
    )
} 
