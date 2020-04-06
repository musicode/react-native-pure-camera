package com.github.musicode.camera

import android.app.Activity
import com.facebook.react.bridge.*

import com.github.herokotlin.cameraview.CameraViewActivity
import com.github.herokotlin.cameraview.CameraViewCallback
import com.github.herokotlin.cameraview.CameraViewConfiguration
import com.github.herokotlin.cameraview.enum.CaptureMode

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
            }

            override fun onCapturePhoto(
                    activity: Activity,
                    photoPath: String,
                    photoSize: Long,
                    photoWidth: Int,
                    photoHeight: Int
            ) {

                val map = Arguments.createMap()

                val photo = Arguments.createMap()
                photo.putString("path", photoPath)
                photo.putInt("size", photoSize.toInt())
                photo.putInt("width", photoWidth)
                photo.putInt("height", photoHeight)

                map.putMap("photo", photo)

                promise.resolve(map)

            }

            override fun onRecordVideo(
                    activity: Activity,
                    videoPath: String,
                    videoSize: Long,
                    videoDuration: Int,
                    photoPath: String,
                    photoSize: Long,
                    photoWidth: Int,
                    photoHeight: Int
            ) {

                val map = Arguments.createMap()

                val video = Arguments.createMap()
                video.putString("path", videoPath)
                video.putInt("size", videoSize.toInt())
                video.putInt("duration", videoDuration)

                val photo = Arguments.createMap()
                photo.putString("path", photoPath)
                photo.putInt("size", photoSize.toInt())
                photo.putInt("width", photoWidth)
                photo.putInt("height", photoHeight)

                map.putMap("video", video)
                map.putMap("photo", photo)

                promise.resolve(map)

            }
        }

        CameraViewActivity.configuration = configuration
        CameraViewActivity.callback = callback

        CameraViewActivity.newInstance(reactContext.currentActivity!!)

    }

}