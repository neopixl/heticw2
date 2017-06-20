package com.neopixl.appsurde.network;

import com.android.volley.Request;
import com.android.volley.VolleyError;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.type.ArrayType;
import com.fasterxml.jackson.databind.type.SimpleType;
import com.neopixl.appsurde.AppSurde;
import com.neopixl.appsurde.model.Episode;
import com.spothero.volley.JacksonRequest;
import com.spothero.volley.JacksonRequestListener;

import java.util.Arrays;
import java.util.List;

/**
 * Created by Yvan Moté on 20/06/2017.
 */

public class EpisodeService {

    public interface EpisodeServiceListener {
        void onReceiveEpisodes(List<Episode> episodes);
        void onFailed(VolleyError error);
    }

    public static void retrieveEpisodes(int showId,
                                        final EpisodeServiceListener listener) {

        String url = UrlBuilder.getEpisodesUrl(showId);

        // Request + Jackson (Parsing)

        JacksonRequest<Episode[]> request =
                new JacksonRequest<Episode[]>(Request.Method.GET
                        , url, new JacksonRequestListener<Episode[]>() {
                    @Override
                    public void onResponse(Episode[] response,
                                           int statusCode,
                                           VolleyError error) {

                        if(listener==null) {
                            return;
                        }

                        if(response!=null) {

                            // callback avec la réponse

                            // Arrays.asList = transformation
                            // d'un tableau [] en List<>
                            listener.onReceiveEpisodes(Arrays.asList(response));
                        }

                        if(error!=null) {

                            // callback avec l'erreur
                            listener.onFailed(error);
                        }


                    }

                    @Override
                    public JavaType getReturnType() {
                        // ArrayType ou SimpleType

                        return ArrayType.construct(
                                SimpleType.constructUnsafe(Episode.class),
                                null);
                    }
                });


        // Envoi de la requête
        AppSurde
                .getSharedInstance()
                .getRequestQueue()
                .add(request);




    }

}
