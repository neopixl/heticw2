package com.neopixl.appsurde.model;

import android.os.Parcel;
import android.os.Parcelable;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * Created by Yvan Moté on 19/06/2017.
 */

@JsonIgnoreProperties(ignoreUnknown = true)
public class Episode implements Parcelable {
    private String name;
    private String summary;

    private Image image;

    // utile pour le Parsing JSON
    public Episode() {

    }

    // utile pour aujourd'hui
    public Episode(String name, String summary) {
        this.name = name;
        this.summary = summary;
    }

    protected Episode(Parcel in) {
        name = in.readString();
        summary = in.readString();
        image = in.readParcelable(Image.class.getClassLoader());
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(name);
        dest.writeString(summary);
        dest.writeParcelable(image, flags);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<Episode> CREATOR = new Creator<Episode>() {
        @Override
        public Episode createFromParcel(Parcel in) {
            return new Episode(in);
        }

        @Override
        public Episode[] newArray(int size) {
            return new Episode[size];
        }
    };

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

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }
}
