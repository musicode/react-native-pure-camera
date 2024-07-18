
import { NativeModules } from 'react-native'

const { RNTCamera } = NativeModules

export default {

  /**
   * @param {Object} options
   * @property {string} options.captureMode
   * @property {string} options.photoBase64Enabled
   * @property {string} options.guideLabelTitle
   * @property {number} options.videoMinDuration
   * @property {number} options.videoMaxDuration
   * @return {Promise}
   */
  open(options) {
    return RNTCamera.open(options)
  }

}
