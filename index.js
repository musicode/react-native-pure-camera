
import { NativeModules } from 'react-native'

const { RNTCamera } = NativeModules

export default {

  /**
   *
   * @param {Object} options
   * @property {boolean} options.countable
   * @property {number} options.maxSelectCount
   * @property {boolean} options.rawButtonVisible
   * @property {number} options.imageMinWidth
   * @property {number} options.imageMinHeight
   * @property {string} options.cancelButtonTitle
   * @property {string} options.rawButtonTitle
   * @property {string} options.submitButtonTitle
   * @return {Promise}
   */
  open(options) {
    return RNTCamera.open(options)
  },

  /**
   * 判断是否有相关权限
   */
  requestPermissions() {
    return RNTCamera.requestPermissions()
  }

}
