package com.neopixl.appsurde.item;

import android.support.v7.widget.RecyclerView;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import com.bumptech.glide.Glide;
import com.mikepenz.fastadapter.items.AbstractItem;
import com.neopixl.appsurde.R;
import com.neopixl.appsurde.model.Episode;

import java.util.List;

import butterknife.BindView;
import butterknife.ButterKnife;

/**
 * Created by Yvan Moté on 19/06/2017.
 */

public class EpisodeItem extends AbstractItem<EpisodeItem, EpisodeItem.EpisodeViewHolder> {


    private Episode episode;

    private EpisodeViewHolder holder;

    public EpisodeItem(Episode episode) {
        this.episode = episode;
    }

    @Override
    public EpisodeViewHolder getViewHolder(View v) {
        return new EpisodeViewHolder(v);
    }

    @Override
    public int getType() {
        // Identifiant unique nécessaire, par exemple l'id d'un composant dans la cellule
        return R.id.row_episode_title_textview;
    }

    @Override
    public int getLayoutRes() {
        return R.layout.row_episode;
    }

    @Override
    public void bindView(EpisodeViewHolder holder, List<Object> payloads) {
        super.bindView(holder, payloads);

        this.holder = holder;

        holder.refresh(episode);
    }

    public Episode getEpisode() {
        return episode;
    }

    public ImageView getImageView() {
        return holder.getImageView();
    }

    // Cellule recyclable
    public class EpisodeViewHolder extends RecyclerView.ViewHolder {

        @BindView(R.id.row_episode_title_textview)
        protected TextView titleTextView;

        @BindView(R.id.row_episode_imageview)
        protected ImageView imageView;

        // itemView = vue récupérée depuis la cache
        public EpisodeViewHolder(View itemView) {
            super(itemView);

            //Butterknife to the rescue
            ButterKnife.bind(this, itemView);
        }

        public void refresh(Episode episode) {
            titleTextView.setText(episode.getName());

            imageView.setImageDrawable(null);

            // Affichage de l'image
            Glide.with(itemView)
                    .load(episode.getImage().getMedium())
                    .into(imageView);
        }

        public ImageView getImageView() {
            return imageView;
        }
    }

}
