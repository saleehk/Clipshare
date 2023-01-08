import React, { useCallback, useEffect, useState } from 'react';
import { Button, ImageRequireSource, Linking } from 'react-native';

import { StyleSheet, View, Text, Image } from 'react-native';
import { Camera, CameraPermissionStatus } from 'react-native-vision-camera';

export function PermissionsPage({ onPermissionStausChange }) {
  const [cameraPermissionStatus, setCameraPermissionStatus] =
    useState('not-determined');

  const requestCameraPermission = useCallback(async () => {
    console.log('Requesting camera permission...');
    const permission = await Camera.requestCameraPermission();

    if (permission === 'denied') {
      await Linking.openSettings();
    }
    setCameraPermissionStatus(permission);
  }, []);
  useEffect(() => {
    onPermissionStausChange && onPermissionStausChange(cameraPermissionStatus);
  }, [cameraPermissionStatus]);

  return (
    <View style={styles.container}>
      {/* <Image source={BANNER_IMAGE} style={styles.banner} /> */}
      <View style={styles.permissionsContainer}>
        {cameraPermissionStatus !== 'authorized' && (
          <>
            <Text style={styles.permissionText}>

              <Text style={styles.bold}>Camera permission</Text>.{' '}
            </Text>
            <Button title="Grand" onPress={requestCameraPermission} />
          </>
        )}
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  welcome: {
    fontSize: 38,
    fontWeight: 'bold',
    maxWidth: '80%',
  },
  banner: {
    position: 'absolute',
    opacity: 0.4,
    bottom: 0,
    left: 0,
  },
  container: {
    flex: 1,
    backgroundColor: 'white',
    // ...SAFE_AREA_PADDING,
  },
  permissionsContainer: {
    // marginTop: CONTENT_SPACING * 2,
  },
  permissionText: {
    fontSize: 17,
  },
  hyperlink: {
    color: '#007aff',
    fontWeight: 'bold',
  },
  bold: {
    fontWeight: 'bold',
  },
});
