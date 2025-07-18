//
//  ViewController.swift
//  SwiftUIPlaygroundUIKit
//
//  Created by Nishan Bende on 18/07/25.
//

import UIKit
import SwiftUI
import MapKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    let swiftUIView = MyMapView()
    let hostingController = UIHostingController(rootView: swiftUIView)

    addChild(hostingController)
    view.addSubview(hostingController.view)
    hostingController.didMove(toParent: self)

    hostingController.view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
        hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }


}

struct MyMapView: View {
    @State var selection: Int?
    @State var position: MapCameraPosition = .automatic

    var body: some View {
        Map(position: $position, selection: $selection) {
            Marker("New York", monogram: Text("NY"), coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060))
                .tag(1)
            Marker("Seattle", monogram: Text("SE"), coordinate: CLLocationCoordinate2D(latitude: 47.6062, longitude: -122.3321))
                .tag(2)
            Marker("San Francisco", monogram: Text("SF"), coordinate: CLLocationCoordinate2D(latitude: 37.7749, longitude: -122.4194))
                .tag(3)
        }.mapControls {
            MapUserLocationButton()
        }
    }
}

