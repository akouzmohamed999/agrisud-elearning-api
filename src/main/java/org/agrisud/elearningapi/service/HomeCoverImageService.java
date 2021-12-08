package org.agrisud.elearningapi.service;

import org.agrisud.elearningapi.dao.HomeCoverDao;
import org.agrisud.elearningapi.dao.HomeCoverImageDao;
import org.agrisud.elearningapi.model.HomeCoverImage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class HomeCoverImageService {

    @Autowired
    HomeCoverDao homeCoverDao;

    @Autowired
    HomeCoverImageDao homeCoverImageDao;

    public void insertHomeCoverImage(HomeCoverImage homeCoverImage) {
        homeCoverImageDao.insertHomeCoverImage(homeCoverImage);
    }

    // never used
    public Optional<List<HomeCoverImage>> getHomeCoverImages(long homeCoverID) {
        return homeCoverImageDao.getHomeCoverImages(homeCoverID).map(homeCoverImages -> {
            homeCoverImages.forEach(homeCoverImage ->
                homeCoverDao.getHomeCover().ifPresent(homeCoverImage::setHomeCover)
            );
            return homeCoverImages;
        });
    }
}
