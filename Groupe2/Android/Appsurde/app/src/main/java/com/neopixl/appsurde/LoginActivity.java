package com.neopixl.appsurde;

import android.support.constraint.ConstraintLayout;
import android.support.design.widget.Snackbar;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.EditText;

import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;

public class LoginActivity extends AppCompatActivity {

    @BindView(R.id.main_layout)
    protected ConstraintLayout mainLayout;

    @BindView(R.id.login_edittext)
    protected EditText loginEditText;

    @BindView(R.id.password_edittext)
    protected EditText passwordEditText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        // A ce moment là on peut accèder à nos composants graphiques

        // Moyen officiel de récupérer un composant
        //EditText loginEditText = (EditText) findViewById(R.id.login_edittext);

        // Pour que les BindView et autres soient effectifs
        ButterKnife.bind(this);
    }

    @OnClick(R.id.login_button)
    public void onLogin() {

        String login = loginEditText.getText().toString();
        String password = passwordEditText.getText().toString();

        boolean credentialsAreNotEmpty = !login.isEmpty()
                && !password.isEmpty();

        if(credentialsAreNotEmpty) {
            showSnackBar(R.string.login_ok);
        } else {
            showSnackBar(R.string.login_failed);
        }

    }

    private void showSnackBar(int message) {
        Snackbar.make(mainLayout, message, Snackbar.LENGTH_SHORT)
                .show();
    }

    @OnClick(R.id.signup_button)
    public void onSignup() {

    }
}
