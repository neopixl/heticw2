package com.neopixl.appsurde;

import android.app.Application;

import com.android.volley.RequestQueue;
import com.android.volley.toolbox.Volley;

/**
 * Created by Yvan Moté on 20/06/2017.
 */

public class AppSurde extends Application {

    private RequestQueue requestQueue;

    // Instance unique
    private static AppSurde sharedInstance;

    @Override
    public void onCreate() {
        super.onCreate();

        //Méthode appelée lorsque votre application démarrera

        AppSurde.sharedInstance = this;

        requestQueue = Volley.newRequestQueue(this);
    }

    public RequestQueue getRequestQueue() {
        return requestQueue;
    }

    public static AppSurde getSharedInstance() {
        return sharedInstance;
    }
}
