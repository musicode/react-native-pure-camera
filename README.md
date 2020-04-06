# react-native-pure-camera

This is a module which help you take photo or take video.

## Installation

```
npm i react-native-pure-camera
// link below 0.60
react-native link react-native-pure-camera
```

## Setup

### iOS

Add `NSCameraUsageDescription` in your `ios/${ProjectName}/Info.plist`:

```
<key>NSCameraUsageDescription</key>
<string>balabala</string>
```

### Android

Add `jitpack` in your `android/build.gradle` at the end of repositories:

```
allprojects {
  repositories {
    ...
    maven { url 'https://jitpack.io' }
  }
}
```

## Usage

```js
import camera from 'react-native-pure-camera'

// At first, make sure you have the permissions.
// ios: CAMERA
// android: CAMERA RECORD_AUDIO

// If you don't have these permissions, you can't call open method.

camera.open({

  // photo: take photo only
  // video: take video only
  // photo_video: take photo by tap, take video by long press
  // default value: 'photo_video'
  captureMode: 'photo|video|photo_video',

  // the text above the take button
  // default value: ''
  guideLabelTitle: '轻触拍照，按住摄像',

  // video min duration in milliseconds
  // default value: 1000
  videoMinDuration: 1000,

  // video max duration in milliseconds
  // default value: 10000
  videoMaxDuration: 10000,

})
.then(data => {

  // if you take video, data.video is the output video.
  data.video

  // if you take photo, data.photo is the output photo.
  // if you take video, data.photo is the first frame of the video
  data.photo

})
.catch(() => {
  // click cancel button
})
```