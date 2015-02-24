package com.teamqraken.qrakenremote;

import java.util.Map;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.RadioGroup.OnCheckedChangeListener;

public class PIDActivity extends Activity implements OnCheckedChangeListener {
	private RadioGroup radioGroup;
	
	private SharedPreferences settings;
	
	public static final String PREFS_NAME = "PIDPREFS";
	
	private final int NUM_PID_PREFS = 3;
	private final int[] PID_PREF_IDS = {R.id.p_value, R.id.i_value, R.id.d_value}; // EditText IDs stored in array for easier batch handling later (i.e. for loops)
	private final String[] PITCH_ROLL_PREF_NAMES = {"RP", "RI", "RD"}; // Ditto
	private float[] pitchRollCoeffs = new float[NUM_PID_PREFS];
	private final String[] YAW_PREF_NAMES = {"YP", "YI", "YD"}; // Ditto
	private float[] yawCoeffs = new float[NUM_PID_PREFS];
	
	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		
		setContentView(R.layout.activity_pid);
		
		// Set result CANCELED in case the user backs out
		setResult(Activity.RESULT_CANCELED);
		
		radioGroup = (RadioGroup)findViewById(R.id.radioGroup);
		radioGroup.setOnCheckedChangeListener(this);

		settings = getSharedPreferences(PREFS_NAME, MODE_PRIVATE);
		Map<String, ?> settingsMap;
		// Try getting settings, will throw exception if there are none saved
		try {
			settingsMap = (Map<String, ?>)settings.getAll();
			
			// Put recovered settings into PID coefficient arrays
			for (int i = 0; i < NUM_PID_PREFS; i++) {
				pitchRollCoeffs[i] = (Float)settingsMap.get(PITCH_ROLL_PREF_NAMES[i]);
				yawCoeffs[i] = (Float)settingsMap.get(YAW_PREF_NAMES[i]);
			}

		} catch (NullPointerException npe) {Log.d("QrakenRemote", "Failed to load SharedPreferences");}
		
		// Select pitch/roll radio button and load preset numbers into text boxes
		((RadioButton)findViewById(R.id.radio_pitch_roll)).setChecked(true);
		loadIntoEditText(pitchRollCoeffs);
	}
	
	public void setPressed(View view) {
		// Recover any changes since the last update
		if (radioGroup.getCheckedRadioButtonId() == R.id.radio_pitch_roll) {
			pitchRollCoeffs = loadFromEditText();
		}
		else if (radioGroup.getCheckedRadioButtonId() == R.id.radio_yaw) {
			yawCoeffs = loadFromEditText();
		}
		
		// Commit state of settings
		SharedPreferences.Editor editor = settings.edit();
		for (int i = 0; i < NUM_PID_PREFS; i++) {
			editor.putFloat(PITCH_ROLL_PREF_NAMES[i], pitchRollCoeffs[i]);
			editor.putFloat(YAW_PREF_NAMES[i], yawCoeffs[i]);
		}
		editor.apply();
		setResult(Activity.RESULT_OK);
		finish();
	}
	
	private void loadIntoEditText(float[] nums) {
		if (nums.length == NUM_PID_PREFS) {
			for (int i = 0; i < nums.length; i++) {
				((EditText)findViewById(PID_PREF_IDS[i])).setText(Float.toString(nums[i]));
			}
		}
	}
	
	private float[] loadFromEditText() {
		float[] nums = new float[NUM_PID_PREFS];
		for (int i = 0; i < nums.length; i++) {
			// If invalid data or no data is entered in THIS particular EditText, just skip it (it will get default of 0.0 from nums initialisation)
			try {
				nums[i] = Float.parseFloat(((EditText)findViewById(PID_PREF_IDS[i])).getText().toString());
			} catch (NumberFormatException nfe) {
			}
		}
		return nums;
	}

	@Override
	public void onCheckedChanged(RadioGroup group, int checkedId) {
		// When new radio button is checked, save the data from the previous EditTexts, and load data into the new ones.
		if (checkedId == R.id.radio_pitch_roll) {
			yawCoeffs = loadFromEditText();
			loadIntoEditText(pitchRollCoeffs);
		}
		else if (checkedId == R.id.radio_yaw) {
			pitchRollCoeffs = loadFromEditText();
			loadIntoEditText(yawCoeffs);
		}
		
	}
	
}
