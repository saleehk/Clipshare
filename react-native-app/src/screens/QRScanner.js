import { View, Text, StyleSheet, Button } from 'react-native';
import React, { useEffect, useState } from 'react';
import { Camera, useCameraDevices } from 'react-native-vision-camera';
import { PermissionsPage } from '../components/CameraPermission';
import QRScanner from '../components/QRScanner';
import { gql, useMutation } from '@apollo/client';
import messaging from '@react-native-firebase/messaging';
import { useMMKVObject, useMMKVString } from 'react-native-mmkv';
// import {} from '../../node_modules/.staging/react-native-mmkv-5e3e98d1/lib/module/hooks';
// import {} from '../../node_modules/.staging/react-native-mmkv-5e3e98d1/lib/module/hooks';

// Define mutation
const SET_DEVICE_TOKEN = gql`
  # Increments a back-end counter and gets its resulting value
  mutation SetDeviceToken($data: DeviceUpdateFcmInput!) {
    setDeviceFcmToken(data: $data) {
      id
    }
  }
`;

function LoadingView() {
  return (
    <View>
      <Text>Loading</Text>
    </View>
  );
}
export default function QRScannerScreen() {
  const [mutateFunction, { data, loading, error }] =
    useMutation(SET_DEVICE_TOKEN);
  const [cameraPermission, setCameraPermission] = useState();
  const [deviceData, setDeviceData] = useMMKVObject('deviceData');
  // const [deviceData, setDeviceData] = useState({});
  // const [qrData, setQrData] = useState();

  useEffect(() => {
    Camera.getCameraPermissionStatus().then(setCameraPermission);
  }, []);
  // useEffect(() => {
  //   if (qrData) {
  //     console.log('QR Data:', qrData);
  //   }
  // },[qrData])
  const showPermissionsPage = cameraPermission !== 'authorized';
  const devices = useCameraDevices();
  const device = devices.back;
  if (device == null) {
    return <LoadingView />;
  }
  function codeHandler(codes) {
    // console.log(codes)
    if (codes.length === 0) {
      return;
    }
    try {
      const jsonData = JSON.parse(codes[0].displayValue);
      setDeviceData(jsonData);
    } catch (error) {
    }
  }

  // console.log('Device Data:', deviceData);
  if (deviceData) {
    return (
      <View
        style={{
          flex: 1,
          justifyContent: 'space-around',
          alignItems: 'center',
        }}>
        {/* {/* <Text>{qrData}</Text> */}
        <Text>{deviceData.deviceName}</Text>
        <Text>{`Status :${deviceData.status ? deviceData.status : 'not linked' }`}</Text>
        <Button title="Scan Again" onPress={() => setDeviceData(null)} />
        <Button
          title={loading ? 'Linking...' : 'Link Device'}
          onPress={async () => {
            await messaging().registerDeviceForRemoteMessages();
            const fcmToken = await messaging().getToken();
            await mutateFunction({
              variables: {
                data: {
                  deviceId: deviceData.deviceId,
                  fcmToken,
                },
              },
            });
            setDeviceData({
              ...deviceData,
              fcmToken,
              status: 'linked',
            });
            // console.log('Linking to', JSON.parse(qrData).deviceId);
          }}
        />
      </View>
    );
  }
  return showPermissionsPage ? (
    <PermissionsPage
      onPermissionStausChange={_permission => {
        setCameraPermission(_permission);
      }}
    />
  ) : (
    <QRScanner onCode={codeHandler} />
  );
}
