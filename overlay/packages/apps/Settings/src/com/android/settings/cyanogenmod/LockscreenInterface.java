/*
 * Copyright (C) 2012 CyanogenMod
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

package com.android.settings.cyanogenmod;

import android.content.ContentResolver;
import android.content.res.Configuration;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceScreen;
import android.provider.Settings;
import android.util.Log;
import com.android.settings.R;
import com.android.settings.SettingsPreferenceFragment;



public class LockscreenInterface extends SettingsPreferenceFragment implements
    Preference.OnPreferenceChangeListener {

    private static final String TAG = "LockscreenInterface";

    private final Configuration mCurConfig = new Configuration();
    
    private static final String PREF_LOCKSCREEN_WEATHER = "lockscreen_weather";
    private static final String PREF_WEATHER_SHOW_LOCATION = "weather_show_location";
    private static final String PREF_WEATHER_SHOW_TIMESTAMP = "weather_show_timestamp";
    private CheckBoxPreference mLockscreenWeather;
    private CheckBoxPreference mWeatherShowLocaton;
    private CheckBoxPreference mWeatherShowTimestamp;
    
    boolean value;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //ContentResolver resolver = getActivity().getContentResolver();

        addPreferencesFromResource(R.xml.lockscreen_interface_settings);
        
        PreferenceScreen prefSet = getPreferenceScreen();

        mLockscreenWeather = (CheckBoxPreference) prefSet.findPreference(PREF_LOCKSCREEN_WEATHER);
        mWeatherShowLocaton = (CheckBoxPreference) prefSet.findPreference(PREF_WEATHER_SHOW_LOCATION);
        mWeatherShowTimestamp = (CheckBoxPreference) prefSet.findPreference(PREF_WEATHER_SHOW_TIMESTAMP);
        
        value = mLockscreenWeather.isChecked();
        if (!value) {
            prefSet.removePreference(mWeatherShowLocaton);
            prefSet.removePreference(mWeatherShowTimestamp);
        }
    }

    @Override
    public void onResume() {
        super.onResume();

        updateState();
    }

    @Override
    public void onPause() {
        super.onPause();
    }

    private void updateState() {
    }

    @Override
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
    	super.onPreferenceTreeClick(preferenceScreen, preference);
    	
    	PreferenceScreen prefSet = getPreferenceScreen();
    	
        /* Preference Screens */
        if (preference == mLockscreenWeather) {
            value = mLockscreenWeather.isChecked();
            Settings.System.putInt(getContentResolver(), Settings.System.LOCKSCREEN_WEATHER,
                    value ? 1 : 0);
			if (value) {
				Log.d(TAG, "Add CM Weather settings!!!");
				prefSet.addPreference(mWeatherShowLocaton);
				prefSet.addPreference(mWeatherShowTimestamp);
			} else {
				Log.d(TAG, "Remove settings for CM Weather!!!");
				prefSet.removePreference(mWeatherShowLocaton);
				prefSet.removePreference(mWeatherShowTimestamp);
			}
            return true;
        } else
        if (preference == mWeatherShowLocaton) {
            value = mWeatherShowLocaton.isChecked();
            Settings.System.putInt(getContentResolver(), Settings.System.WEATHER_SHOW_LOCATION,
                    value ? 1 : 0);
            return true;
        } else
        if (preference == mWeatherShowTimestamp) {
            value = mWeatherShowTimestamp.isChecked();
            Settings.System.putInt(getContentResolver(), Settings.System.WEATHER_SHOW_TIMESTAMP,
                    value ? 1 : 0);
            return true;
        }
        //return super.onPreferenceTreeClick(preferenceScreen, preference);
        return false;
    }

    public boolean onPreferenceChange(Preference preference, Object objValue) {
        final String key = preference.getKey();

        return true;
    }
}
