package com.neopixl.appsurde.network;

/**
 * Created by Yvan Moté on 20/06/2017.
 */

public class UrlBuilder {

    // http://api.tvmaze.com/shows/73/episodes

    private enum Environment {
        DEV, PROD, TEST
    }

    // final = constante, non modifiable
    private static final String BASE_URL =
            "http://api.tvmaze.com";

    private static final String DEV_BASE_URL =
            "http://dev.api.tvmaze.com";

    private static Environment CURRENT_ENVIRONMENT
            = Environment.PROD;

    public static String getEpisodesUrl(int showId) {
        return getBaseUrl()+"/shows/"+showId+"/episodes";
    }

    private static String getBaseUrl() {
        switch (CURRENT_ENVIRONMENT) {
            case PROD: return BASE_URL;
            case DEV: return DEV_BASE_URL;
            default: return BASE_URL;
        }
    }


}
