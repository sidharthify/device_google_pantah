/*
 * Copyright (C) 2021 The LineageOS Project
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
 */

package org.lineageos.settings;

import android.content.Context;
import android.content.pm.PackageManager;
import android.util.Log;

class EuiccDisabler {
    private static final String TAG = "GoogleParts";
    private static final String[] EUICC_PACKAGES = new String[]{
        "com.google.android.euicc",
        "com.google.euiccpixel"
    };

    public static void enableOrDisableEuicc(Context context) {
        PackageManager pm = context.getPackageManager();
        int flag = PackageManager.COMPONENT_ENABLED_STATE_ENABLED;
        for (String pkg : EUICC_PACKAGES) {
            try {
                pm.setApplicationEnabledSetting(pkg, flag, 0);
            } catch (IllegalArgumentException e) {
                Log.d(TAG, "package " + pkg + " is not present");
            }
        }
    }
}
