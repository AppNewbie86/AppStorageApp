import SwiftUI

struct PlaneRow: View {
    
    // Erstellen einer Instanz von FlightSearchViewModel als StateObject, um ihre Eigenschaften zwischen den Ansichtsaktualisierungen zu erhalten
    @StateObject var viewModel = FlightSearchViewModel()
    
    // Darstellung der SwiftUI-Ansicht
    var body: some View {
     
        NavigationView {
            // ZStack zur Anordnung von Elementen in einer Schichtung
            ZStack{
                Color.orange.opacity(0.55)
                    .ignoresSafeArea()
                Image("berge")
                    .resizable()
                    .ignoresSafeArea()
                    .opacity(0.65)
                VStack {
                    PlaneCard()
                    Button("Fetch Flight Destinations") {
                        viewModel.fetchFlightDestinations {}
                    }
                    // List zur Darstellung der Flugziele
                    List(viewModel.flightDestinations) { destination in
                        // VStack zur Anordnung der Textelemente in einer vertikalen Richtung
                        VStack(alignment: .leading) {
                            Text(destination.destination)
                                .font(.headline)
                            Text("From: \(destination.origin)")
                            Text("Departure Date: \(destination.departureDate)")
                            Text("Return Date: \(destination.returnDate)")
                            Text("Price: \(destination.price.total)")
                        }
                        .padding()
                        .background(Color.black.opacity(0.8)) // Anpassung der Transparenz
                        .cornerRadius(10) // Abgerundete Ecken
                    }
                }
                .padding()
            }
            .navigationTitle("Flight Destinations")
        }
    }
}
    
struct PlaneRow_Previews: PreviewProvider {
    static var previews: some View {
    PlaneRow()
        }
    }
