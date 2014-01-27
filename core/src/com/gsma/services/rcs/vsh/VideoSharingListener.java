/*******************************************************************************
 * Software Name : RCS IMS Stack
 *
 * Copyright (C) 2010 France Telecom S.A.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
package com.gsma.services.rcs.vsh;


/**
 * Video sharing event listener
 * 
 * @author Jean-Marc AUFFRET
 */
public abstract class VideoSharingListener extends IVideoSharingListener.Stub {
	/**
	 * Callback called when the sharing is started
	 */
	public abstract void onSharingStarted();
	
	/**
	 * Callback called when the sharing has been aborted or terminated
	 */
	public abstract void onSharingAborted();

	/**
	 * Callback called when the sharing has failed
	 * 
	 * @param error Error
	 * @see VideoSharing.Error
	 */
	public abstract void onSharingError(int error);
}