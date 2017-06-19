package com.neopixl.appsurde.model;

/**
 * Created by Yvan Moté on 19/06/2017.
 */

public class Episode {
    private String name;
    private String summary;



    // utile pour le Parsing JSON
    public Episode() {

    }

    // utile pour aujourd'hui
    public Episode(String name, String summary) {
        this.name = name;
        this.summary = summary;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSummary() {
        return summary;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }
}
