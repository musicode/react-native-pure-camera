package com.github.musicode.camera

import android.app.Activity
import com.facebook.react.bridge.*

import com.github.herokotlin.cameraview.CameraViewActivity
import com.github.herokotlin.cameraview.CameraViewCallback
import com.github.herokotlin.cameraview.CameraViewConfiguration
import com.github.herokotlin.cameraview.enum.CaptureMode
import com.github.herokotlin.cameraview.model.Photo
import com.github.herokotlin.cameraview.model.Video

class RNTCameraModule(private val reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext) {

    override fun getName(): String {
        return "RNTCamera"
    }

    @ReactMethod
    fun open(options: ReadableMap, promise: Promise) {

        val configuration = object: CameraViewConfiguration() {

        }

        if (options.hasKey("captureMode")) {
            configuration.captureMode = when (options.getString("captureMode") as String) {
                "photo" -> {
                    CaptureMode.PHOTO
                }
                "video" -> {
                    CaptureMode.VIDEO
                }
                else -> {
                    CaptureMode.PHOTO_VIDEO
                }
            }
        }

        if (options.hasKey("photoBase64Enabled")) {
            configuration.photoBase64Enabled = options.getBoolean("photoBase64Enabled")
        } else {
            configuration.photoBase64Enabled = false
        }

        if (options.hasKey("guideLabelTitle")) {
            configuration.guideLabelTitle = options.getString("guideLabelTitle") as String
        }

        if (options.hasKey("guideLabelTitle")) {
            configuration.guideLabelTitle = options.getString("guideLabelTitle") as String
        }

        if (options.hasKey("videoMinDuration")) {
            configuration.videoMinDuration = options.getInt("videoMinDuration").toLong()
        }

        if (options.hasKey("videoMaxDuration")) {
            configuration.videoMaxDuration = options.getInt("videoMaxDuration").toLong()
        }

        val callback = object: CameraViewCallback {
            override fun onExit(activity: Activity) {
                activity.finish()
                promise.reject("-1", "cancel")
            }

            override fun onCapturePhoto(
                    activity: Activity,
                    photo: Photo
            ) {

                activity.finish()

                val map = Arguments.createMap()

                val photoData = Arguments.createMap()
                photoData.putString("path", photo.path)
                photoData.putString("base64", photo.base64)
                photoData.putInt("size", photo.size.toInt())
                photoData.putInt("width", photo.width)
                photoData.putInt("height", photo.height)

                map.putMap("photo", photoData)

                promise.resolve(map)

            }

            override fun onRecordVideo(
                    activity: Activity,
                    video: Video,
                    photo: Photo
            ) {

                activity.finish()

                val map = Arguments.createMap()

                val videoData = Arguments.createMap()
                videoData.putString("path", video.path)
                videoData.putInt("size", video.size.toInt())
                videoData.putInt("duration", video.duration)

                val photoData = Arguments.createMap()
                photoData.putString("path", photo.path)
                photoData.putString("base64", photo.base64)
                photoData.putInt("size", photo.size.toInt())
                photoData.putInt("width", photo.width)
                photoData.putInt("height", photo.height)

                map.putMap("video", videoData)
                map.putMap("photo", photoData)

                promise.resolve(map)

            }
        }

        CameraViewActivity.configuration = configuration
        CameraViewActivity.callback = callback

        CameraViewActivity.newInstance(reactContext.currentActivity!!)

    }

}
