//
//  ContentView.swift
//  LiveActivity
//
//  Created by Omega on 08.08.2022.
//

import SwiftUI
import ActivityKit

struct ContentView: View {
    
    @State var currentId = ""
    @State var currentStatus: Status = .progress
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            VStack {
                Picker(selection: $currentStatus) {
                    Text("Waiting")
                        .tag(Status.waiting)
                    Text("In progress")
                        .tag(Status.progress)
                    Text("Waiting payment")
                        .tag(Status.needPay)
                } label: {}
                    .labelsHidden()
                    .pickerStyle(.segmented)
            }
        }
        .navigationTitle("Live Activity")
        .padding(15)
        .onChange(of: currentStatus) { newValue in
            if let activity = Activity.activities.first(where: { (activity: Activity<ChargeAttributes>) in
                activity.id == currentId
            }) {
                print("Activity found")
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    var updatedState = activity.contentState
                    updatedState.status = currentStatus
                    Task {
                        await activity.update(using: updatedState)
                    }
                }
            }
        }
        .onLoad {
            addActivity()
        }
        .onReceive(timer) { input in
            if currentStatus == .progress {
                chargingSum += 1
                chargingValue += 1
            }
        }
    }
    
    func addActivity() {
        let chargeAttributes = ChargeAttributes()
        let contentState = ChargeAttributes.ContentState()
        
        do {
            let activity = try Activity<ChargeAttributes>.request(attributes: chargeAttributes,
                                                                 contentState: contentState,
                                                                 pushType: nil)
            currentId = activity.id
            print("activity added", activity)
        } catch {
            print(error.localizedDescription)
        }
    }
}
