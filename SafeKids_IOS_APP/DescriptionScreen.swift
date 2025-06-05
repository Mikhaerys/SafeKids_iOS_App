import SwiftUI

struct DescriptionScreen: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("¿Qué es SafeKids?")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                DescriptionCard(
                    title: "Nuestra Misión",
                    description: "SafeKids es una aplicación diseñada para mejorar la seguridad y el bienestar de los niños en el entorno escolar, facilitando su monitoreo y asegurando su salida segura de la institución, también brinda herramientas que mejoran tanto la comunicación como el manejo de cuentas con dinero para los estudiantes.",
                    iconName: "target"
                )
                
                DescriptionCard(
                    title: "Para Docentes",
                    description: "Los docentes pueden registrar actividades y reportar incidentes.",
                    iconName: "person.fill"
                )
                
                DescriptionCard(
                    title: "Para Acudientes",
                    description: "Los acudientes pueden estar al tanto de las actividades de sus niños, recibir notificaciones importantes y mantener un contacto directo con los docentes.",
                    iconName: "person.2.fill"
                )
                
                DescriptionCard(
                    title: "Creadores",
                    description: "Catalina Torres Arenas\nMiguel Angel Maldonado Bautista\nBryan Andres Suarez Sachez",
                    iconName: "person.3.fill"
                )
                
            }
            .padding()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DescriptionCard: View {
    let title: String
    let description: String
    let iconName: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: iconName)
                    .font(.title2)
                    .foregroundColor(.blue)
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            
            Text(description)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    NavigationStack {
        DescriptionScreen()
    }
} 
