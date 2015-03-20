/*******************************************************************************
 * Software Name : RCS IMS Stack
 *
 * Copyright (C) 2010 France Telecom S.A.
 * Copyright (C) 2014 Sony Mobile Communications AB.
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
 *
 * NOTE: This file has been modified by Sony Mobile Communications AB.
 * Modifications are licensed under the License.
 ******************************************************************************/

package com.orangelabs.rcs.core.ims.service.im.filetransfer.http;

import android.net.Uri;

/**
 * File transfer over HTTP info document
 *
 * @author vfml3370
 */
public class FileTransferHttpInfoDocument {
    /**
     * MIME type
     */
    public static final String MIME_TYPE = "application/vnd.gsma.rcs-ft-http+xml";

    /**
     * File size
     */
    private int size = 0;

    /**
     * File content type
     */
    private String type = null;

    /**
     * URI of the file
     */
    private Uri file = null;

    /**
     * Validity of the file
     */
    private long validity = 0;

    /**
     * File thumbnail
     */
    private FileTransferHttpThumbnail thumbnail = null;

    /**
     * Filename
     */
    private String fileName;

    /**
     * Constructor
     */
    public FileTransferHttpInfoDocument() {
    }

    /**
     * Set file thumbnail
     *
     * @param thumbnail Thumbnail
     */
    public void setFileThumbnail(FileTransferHttpThumbnail thumbnail) {
        this.thumbnail = thumbnail;
    }

    /**
     * Get file thumbnail
     *
     * @return File thumbnail
     */
    public FileTransferHttpThumbnail getFileThumbnail() {
        return thumbnail;
    }

    /**
     * Get file transfer validity
     *
     * @return Validity
     */
    public long getTransferValidity() {
        return validity;
    }

    /**
     * Set file transfer validity
     * 
     * @param validity Validity
     */
    public void setTransferValidity(long validity) {
        this.validity = validity;
    }

    /**
     * Get file URI
     *
     * @return File URI
     */
    public Uri getFileUri() {
        return file;
    }

    /**
     * Set file URI
     *
     * @param file
     */
    public void setFileUri(Uri file) {
        this.file = file;
    }

    /**
     * Get file content type
     *
     * @return File content type
     */
    public String getFileType() {
        return type;
    }

    /**
     * Set file content type
     *
     * @param type File content type
     */
    public void setFileType(String type) {
        this.type = type;
    }

    /**
     * Get file size
     *
     * @return File size
     */
    public int getFileSize() {
        return size;
    }

    /**
     * Set file size
     *
     * @param size File size
     */
    public void setFileSize(int size) {
        this.size = size;
    }

    /**
     * Set the fileName
     * 
     * @param fileName FileName
     */
    public void setFilename(String fileName) {
        this.fileName = fileName;
    }

    /**
     * Return the fileName
     * 
     * @return FileName
     */
    public String getFilename() {
        return fileName;
    }
}
