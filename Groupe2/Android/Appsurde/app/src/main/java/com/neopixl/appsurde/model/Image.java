package com.neopixl.appsurde.model;

import android.os.Parcel;
import android.os.Parcelable;

/**
 * Created by Yvan Moté on 20/06/2017.
 */

public class Image implements Parcelable {
    private String medium;
    private String original;

    public Image() {

    }

    protected Image(Parcel in) {
        medium = in.readString();
        original = in.readString();
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(medium);
        dest.writeString(original);
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public static final Creator<Image> CREATOR = new Creator<Image>() {
        @Override
        public Image createFromParcel(Parcel in) {
            return new Image(in);
        }

        @Override
        public Image[] newArray(int size) {
            return new Image[size];
        }
    };

    public String getMedium() {
        return medium;
    }

    public void setMedium(String medium) {
        this.medium = medium;
    }

    public String getOriginal() {
        return original;
    }

    public void setOriginal(String original) {
        this.original = original;
    }
}
