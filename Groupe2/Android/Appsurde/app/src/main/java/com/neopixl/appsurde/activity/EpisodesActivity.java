package com.neopixl.appsurde.activity;

import android.content.Intent;
import android.support.v4.app.ActivityOptionsCompat;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.ImageView;

import com.android.volley.VolleyError;
import com.mikepenz.fastadapter.FastAdapter;
import com.mikepenz.fastadapter.IAdapter;
import com.mikepenz.fastadapter.commons.adapters.FastItemAdapter;
import com.neopixl.appsurde.R;
import com.neopixl.appsurde.item.EpisodeItem;
import com.neopixl.appsurde.model.Episode;
import com.neopixl.appsurde.model.Image;
import com.neopixl.appsurde.network.EpisodeService;

import java.util.ArrayList;
import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

public class EpisodesActivity extends AppCompatActivity {

    private List<Episode> episodesList;

    @BindView(R.id.episodes_recycler_view)
    protected RecyclerView episodesRecyclerView;
    private FastItemAdapter<EpisodeItem> episodesItemAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_episodes);

        ButterKnife.bind(this);

        episodesList = new ArrayList<Episode>();

        // Adapter = la classe qui retournera les cellules à la RecyclerView
        episodesItemAdapter = new FastItemAdapter<EpisodeItem>();

        EpisodeService.retrieveEpisodes(73, new EpisodeService.EpisodeServiceListener() {
            @Override
            public void onReceiveEpisodes(List<Episode> episodes) {
                for(Episode episode : episodes) {
                    episodesItemAdapter.add(new EpisodeItem(episode));
                }
            }

            @Override
            public void onFailed(VolleyError error) {
                // afficher une SnackBar
            }
        });

        episodesItemAdapter.withOnClickListener(new FastAdapter.OnClickListener<EpisodeItem>() {
            @Override
            public boolean onClick(View v,
                                   IAdapter<EpisodeItem> adapter,
                                   EpisodeItem item,
                                   int position) {

                ImageView imageViewOrigin = item.getImageView();

                Episode episode = item.getEpisode();

                Intent intent = DetailEpisodeActivity.createIntent(EpisodesActivity.this,
                        episode);

                String transitionName = getString(R.string.transition_to_detail);

                ActivityOptionsCompat options =
                        ActivityOptionsCompat
                                .makeSceneTransitionAnimation(EpisodesActivity.this,
                                        imageViewOrigin, transitionName);

                startActivity(intent, options.toBundle());

                return true;
            }
        });

        // Créer le LayoutManager
        LinearLayoutManager linearLayoutManager = new LinearLayoutManager(this,
                LinearLayoutManager.VERTICAL, false);

        // Lier le LayoutManager à la RecyclerView
        episodesRecyclerView.setLayoutManager(linearLayoutManager);

        // Lier l'adaptateur à la RecyclerView
        episodesRecyclerView.setAdapter(episodesItemAdapter);

        // Tadam !



    }
}
