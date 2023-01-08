//
//  AppSettings.swift
//  ClipShare
//
//  Created by Saleeh k on 07/01/23.
//

import Foundation

import Apollo

let apollo = ApolloClient(url: URL(string: "https://copy-link.saleeh.workers.dev/")!)
//let apollo = ApolloClient(url: URL(string: "https://2ef4fbafb4.to.intercept.rest")!)

struct DefaultsKeys {
    static let deviceID = "__deviceId__"
}
func saveDeviceId(deviceId:String)
{
   let defaults = UserDefaults.standard
   defaults.set(deviceId, forKey: DefaultsKeys.deviceID)
}
func getDeviceId() -> String?{
    let defaults = UserDefaults.standard
    if let deviceId = defaults.string(forKey: DefaultsKeys.deviceID) {
        return deviceId;
    }else {
        return nil
    }
}
func getDeviceName()-> String{
    let finalalDeviceName: String;
    if let deviceName = Host.current().localizedName{
        finalalDeviceName = deviceName
    }else{
        finalalDeviceName = "No Name"
        
    }
    return finalalDeviceName
}
func regiserDevice()  {
    let deviceName = getDeviceName()
    let deviceinput =  ClipShareGQLDB.DeviceCreateInput(name: deviceName)
    apollo.perform(mutation: ClipShareGQLDB.RegisterDeviceMutation(data: deviceinput)) {
        result in
      guard let data = try? result.get().data else { return }
        let _deviceId = data.createDevice.id
        saveDeviceId(deviceId: _deviceId)
    }
}
func checkRegisterStatus()
{
    if(getDeviceId()==nil)
    {
     regiserDevice()
    }else{
        print("Already Registered")
    }
}

func getJSONParams(text:String!)->String{
    var test = [String : String] ()
    test["text"] = text

    let encoder = JSONEncoder()
    var jsonString :String = "{}"
    if let json = try? encoder.encode(test) {
        jsonString = String(data: json, encoding: .utf8)!
    }
    return jsonString
}

func sendToPhone(clipboard:String)
{
    if(getDeviceId() != nil){
        let data = ClipShareGQLDB.NotificationInput(deviceId:getDeviceId()!,title:"From Mac",body: "Body server",action: "COPY_TEXT",params: getJSONParams(text: clipboard))
        
        apollo.perform(mutation: ClipShareGQLDB.SendToDeviceMutation(data: data)){
            result in
            guard let data = try? result.get().data else { return }
            print(data)
            //        let _deviceId = data.createDevice.id
            //        saveDeviceId(deviceId: _deviceId)
        }
    }
}
