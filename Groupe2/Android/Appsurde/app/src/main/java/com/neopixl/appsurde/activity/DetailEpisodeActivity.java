package com.neopixl.appsurde.activity;

import android.content.Context;
import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.webkit.WebView;
import android.widget.ImageView;

import com.bumptech.glide.Glide;
import com.neopixl.appsurde.R;
import com.neopixl.appsurde.model.Episode;

import butterknife.BindView;
import butterknife.ButterKnife;

public class DetailEpisodeActivity extends AppCompatActivity {

    private static final String EXTRA_EPISODE = "episode";

    @BindView(R.id.detail_episode_imageview)
    protected ImageView imageView;

    @BindView(R.id.detail_episode_webview)
    protected WebView webView;

    public static Intent createIntent(Context context, Episode episode) {
        Intent intent = new Intent(context, DetailEpisodeActivity.class);
        // putExtra : pour insérer des méta-données utilisables par l'activité finale
        intent.putExtra(EXTRA_EPISODE, episode);
        return intent;
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail_episode);

        ButterKnife.bind(this);

        Episode episode = getIntent().getParcelableExtra(EXTRA_EPISODE);

        if(episode!=null) {
            //pour afficher le titre dans l'Action Bar
            setTitle(episode.getName());

            Glide.with(this)
                    .load(episode.getImage().getMedium())
                    .into(imageView);

            webView.loadData(episode.getSummary(), "text/html", "UTF-8");

        }
    }
}
