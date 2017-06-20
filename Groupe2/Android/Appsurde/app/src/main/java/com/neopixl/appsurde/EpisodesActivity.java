package com.neopixl.appsurde;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;

import com.android.volley.VolleyError;
import com.mikepenz.fastadapter.commons.adapters.FastItemAdapter;
import com.neopixl.appsurde.item.EpisodeItem;
import com.neopixl.appsurde.model.Episode;
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

        // Création des épisodes

        episodesList.add(new Episode("Les noces rouges",
                "Ca va saigner"));
        episodesList.add(new Episode("La mouche",
                "Satané mouche"));
        episodesList.add(new Episode("Le retour du Jedi",
                "Il est de retour"));
        episodesList.add(new Episode("First Blood",
                "Rambo est là"));
        episodesList.add(new Episode("Les rivières pourpres",
                "Des meurtres de sang froid."));
        episodesList.add(new Episode("Beetlejuice",
                "Beetlejuice, Beetlejuice, Beetlejuice!"));
        episodesList.add(new Episode("Narcos", ""));
        episodesList.add(new Episode("Le parrain II", ""));
        episodesList.add(new Episode("Le retour de la momie", ""));
        episodesList.add(new Episode("Les bronzés font du ski", ""));
        episodesList.add(new Episode("Les deux tours de la présidentielle", ""));
        episodesList.add(new Episode("Le retour de Murdock", "Mac Gyver"));
        episodesList.add(new Episode("Rick Hunter", ""));
        episodesList.add(new Episode("Fantomas contre Scotland Yard", ""));
        episodesList.add(new Episode("Princesse Mononoke", ""));
        episodesList.add(new Episode("Charlie et la chocolaterie", ""));
        episodesList.add(new Episode("Inception", ""));
        episodesList.add(new Episode("Dikenek",
                "M'man je n'ai rien su faire, je me suis faire carjacker."));


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

        /*
        for(Episode episode : episodesList) {
            EpisodeItem item = new EpisodeItem(episode);
            episodesItemAdapter.add(item);
        }
        */

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
