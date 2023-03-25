//
//  UberMapViewRepresentable.swift
//  UberSwiftUITutorial
//
//  Created by Kant on 2023/03/16.
//

import SwiftUI
import MapKit

struct UberMapViewRepresentable: UIViewRepresentable {

    let mapView = MKMapView()
    let locationManager = LocationManager()
    
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel: LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
        
        return mapView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print("DEBUG: Map state is \(mapState)")
        
        switch mapState {
        case .noInput:
            context.coordinator.clearMapViewAndRecenterOnUserLocation()
            break
        case .searchingForLocation:
            break
        case .locationSelected:
            if let coordinate = locationViewModel.selectedLocationCoordinate {
                context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
                context.coordinator.configurePolyline(withDestinationCoordinate: coordinate)
            }
            break
        }
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension UberMapViewRepresentable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        
        // MARK: - Properties
        let parent: UberMapViewRepresentable
        var userLocationCoordinate: CLLocationCoordinate2D?
        var currentRegion: MKCoordinateRegion?
        
        
        // MARK: - LifeCycle
        init(parent: UberMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        
        // MARK: - MKMapViewDelegate
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude,
                                               longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            
            self.currentRegion = region
            
            parent.mapView.setRegion(region, animated: true)
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let polyline = MKPolylineRenderer(overlay: overlay)
            polyline.strokeColor = .systemBlue
            polyline.lineWidth = 6
            return polyline
        }
        
        // MARK: - Helpers
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D) {
            parent.mapView.removeAnnotations(parent.mapView.annotations) // 기존 마커 제거
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapView.addAnnotation(anno)
            parent.mapView.selectAnnotation(anno, animated: true)
            
            parent.mapView.showAnnotations(parent.mapView.annotations, animated: true)
        }
        
        func configurePolyline(withDestinationCoordinate coordinate: CLLocationCoordinate2D) {
            guard let userLocationCoordinate = self.userLocationCoordinate else { return }
            getDestinationRoute(from: userLocationCoordinate, to: coordinate) { route in
                self.parent.mapView.addOverlay(route.polyline)
            }
        }
        
        func getDestinationRoute(from userLocation: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping(MKRoute) -> Void) {
            let userPlacemark = MKPlacemark(coordinate: userLocation)
            let destinationPlacemark = MKPlacemark(coordinate: destination)
            let request = MKDirections.Request()
            request.source = MKMapItem(placemark: userPlacemark)
            request.destination = MKMapItem(placemark: destinationPlacemark)
            let directions = MKDirections(request: request)
            
            directions.calculate { response, error in
                if let error = error {
                    return 
                }
                
                guard let route = response?.routes.first else { return }
                completion(route)
            }
        }
        
        func clearMapViewAndRecenterOnUserLocation() {
            parent.mapView.removeAnnotations(parent.mapView.annotations)
            parent.mapView.removeOverlays(parent.mapView.overlays)
            
            if let currentRegion = currentRegion {
                parent.mapView.setRegion(currentRegion, animated: true)
            }
        }
    }
}
